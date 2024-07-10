//
//  RNPackageLoader.h
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import <Foundation/Foundation.h>

#import <React/RCTBridge.h>
#import <React/RCTBridgeDelegate.h>

#import "RNPackage.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNPackageLoader : NSObject
@property (nonatomic, assign) RNPackageType type;
@property (nonatomic, strong) RCTBridge *bridge;

- (void)setup;

- (void)loadPkgWith:(RNPackageType)type;
@end

NS_ASSUME_NONNULL_END
