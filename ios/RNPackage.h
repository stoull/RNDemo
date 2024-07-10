//
//  RNPackage.h
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
  RNPackageTypeCommod,
  RNPackageTypeBusiness,
  RNPackageTypeBusiness2,
} RNPackageType;

@interface RNPackage : NSObject
@property (nonatomic, assign) RNPackageType type;
@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, strong) NSURL *url;

+ (RNPackage * _Nonnull)localPackageFor:(RNPackageType)type;
+ (NSString *)moduleNameFor:(RNPackageType)type;
+ (NSString *)resourceNameFor:(RNPackageType)type;
@end

NS_ASSUME_NONNULL_END
