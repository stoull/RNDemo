//
//  RNPackage.m
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import "RNPackage.h"

@implementation RNPackage

+(RNPackage * _Nonnull)localPackageFor:(RNPackageType)type {
  RNPackage *newPkg = [[RNPackage alloc] init];
  NSString *resourceName = [RNPackage resourceNameFor:type];
  NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:resourceName withExtension:@"jsbundle"];
  if (fileUrl == nil) {
    return nil;
  }
  newPkg.moduleName = [RNPackage moduleNameFor:type];
  newPkg.url = fileUrl;
  newPkg.type = type;
  return newPkg;
}

+ (NSString *)moduleNameFor:(RNPackageType)type {
  NSString *nName = @"";
  switch (type) {
    case RNPackageTypeCommod:
      nName = @"";
      break;
    case RNPackageTypeBusiness:
      nName = @"RNDemo";
      break;
    case RNPackageTypeShineToolsKit:
      nName = @"shinetoolskit";
      break;
    default:
      break;
  }
  return nName;
}

+ (NSString *)resourceNameFor:(RNPackageType)type {
  NSString *nName = @"";
  switch (type) {
    case RNPackageTypeCommod:
      nName = @"common.ios";
      break;
    case RNPackageTypeBusiness:
      nName = @"business";
      break;
    case RNPackageTypeShineToolsKit:
      nName = @"shinetoolskit";
      break;
    default:
      break;
  }
  return nName;
}

@end
