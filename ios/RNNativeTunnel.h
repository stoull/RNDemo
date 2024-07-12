//
//  RNNativeTunnel.h
//  RNDemo
//
//  Created by hut on 2024/7/11.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNNativeTunnel : RCTEventEmitter <RCTBridgeModule>
- (void)callJS:(NSString *)methodName params:(NSDictionary*)params;

- (void)callJS:(NSString *)methodName params:(NSDictionary*)params success:(void (^)(NSDictionary *resDic))success failure:(void (^)(NSString *errorMsg))failure;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
