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
- (void)callJSMethod;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
