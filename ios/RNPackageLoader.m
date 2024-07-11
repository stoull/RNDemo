//
//  RNPackageLoader.m
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import "RNPackageLoader.h"
#import "RCTBridge+Exports.h"

@interface RNPackageLoader() <RCTBridgeDelegate>

@end

@implementation RNPackageLoader


- (void)setup {
  self.type = RNPackageTypeCommod;

  
  self.bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bridgeDidFinishLoading:) name:RCTJavaScriptDidLoadNotification object:nil];
}

- (void)loadPkgWith:(RNPackageType)type {
  RNPackage *buPkg = [RNPackage localPackageFor:type];
  if (buPkg.url == nil) {
    return;
  }
  [self loadScrip:buPkg.url];
}

- (void)loadScrip:(NSURL *)jsBundleUrl {
  NSData *jsData = [NSData dataWithContentsOfURL:jsBundleUrl];
  if (jsData == nil) {
    return;
  }
  [self.bridge.batchedBridge executeApplicationScript:jsData url:jsBundleUrl async:true];
}

- (void)bridgeDidFinishLoading:(NSNotification *)noti {
  RCTBridge *bridge = (RCTBridge *)noti.userInfo[@"bridge"];
  NSLog(@"已加载JavaScript bundle URL: %@", bridge.bundleURL);
  NSLog(@"moduleClasses: %@", bridge.moduleClasses);
}

- (NSURL * _Nullable)sourceURLForBridge:(nonnull RCTBridge *)bridge { 
  NSURL *commonUrl = [[NSBundle mainBundle] URLForResource:@"common.ios" withExtension:@"jsbundle"];
  return commonUrl;
}

@end
