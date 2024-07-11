//
//  RNNativeTunnel.m
//  RNDemo
//
//  Created by hut on 2024/7/11.
//

#import "RNNativeTunnel.h"
#import "AppDelegate.h"

@implementation RNNativeTunnel
{
  bool hasListeners;
}

static RNNativeTunnel *_sharedInstance = nil;

RCT_EXPORT_MODULE();

+ (id)allocWithZone:(NSZone *)zone {
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
RCT_EXPORT_METHOD(processResult:(NSString *)result){
    NSLog(@"原生收到回复: %@", result);
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

- (void)callJSMethod {
  if (hasListeners) {
    [self sendEventWithName:@"STATIONSETUP" body:@{@"UFO000001": @"建站流程是什么？"}];
  }
}

@end
