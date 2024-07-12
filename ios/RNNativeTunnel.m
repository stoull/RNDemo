//
//  RNNativeTunnel.m
//  RNDemo
//
//  Created by hut on 2024/7/11.
//

#import "RNNativeTunnel.h"
#import "AppDelegate.h"

@interface RNNativeTunnel()
@property (nonatomic, copy) void (^successBlock)(NSDictionary *resDic);
@property (nonatomic, copy) void (^failedBlock)(NSString *errorMsg);
@end


@implementation RNNativeTunnel
{
  bool hasListeners;
  bool isProcessing;
}

static RNNativeTunnel *_sharedInstance = nil;

RCT_EXPORT_MODULE();

+ (id)allocWithZone:(NSZone *)zone {
  NSLog(@"RNNativeTunnel allocWithZoneallocWithZoneallocWithZoneallocWithZone");
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [super allocWithZone:zone];
  });
  return _sharedInstance;
}

+ (instancetype)sharedInstance {
  return _sharedInstance;
}

// RN返回给原生结果的方法
RCT_EXPORT_METHOD(processResult:(NSDictionary *)result){
    NSLog(@"原生收到回复: %@", result);
  isProcessing = false;
  if ([result[@"isSuccess"] boolValue]) {
    if (self.successBlock != nil) {
      self.successBlock(result);
    }
  } else {
    if (self.failedBlock != nil) {
      self.failedBlock(result[@"message"]);
    }
  }
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"STATIONSETUP"];
}

// 在添加第一个监听函数时触发
-(void)startObserving {
    hasListeners = YES;
}

-(void)stopObserving {
    hasListeners = NO;
}

- (void)callJS:(NSString *)methodName params:(NSDictionary*)params success:(void (^)(NSDictionary *resDic))success failure:(void (^)(NSString *errorMsg))failure {
  if (isProcessing == true) {
    failure(@"正忙中....");
    return;
  }
  
  if (hasListeners) {
    isProcessing = true;
    self.successBlock = success;
    self.failedBlock = failure;
    [self sendEventWithName:@"STATIONSETUP" body:@{@"methodName": methodName, @"params": params}];
  }
}

- (void)callJS:(NSString *)methodName params:(NSDictionary*)params {
  if (hasListeners) {
    [self sendEventWithName:@"STATIONSETUP" body:@{@"methodName": methodName, @"params": params}];
  }
}

@end
