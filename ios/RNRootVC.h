//
//  RNRootVC.h
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import <UIKit/UIKit.h>
#import <React/RCTBridge.h>
#import <React/RCTRootView.h>
#import "RNPackage.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNRootVC : UIViewController
// 使用这个方法前注意，对应的module已经加载进bridge里面
+ (RNRootVC *)createRNVCWith:(RNPackageType)type bridge:(RCTBridge *)bridge;
@end

NS_ASSUME_NONNULL_END
