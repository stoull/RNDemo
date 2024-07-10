//
//  RNRootVC.m
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#import "RNRootVC.h"

@interface RNRootVC ()

@end

@implementation RNRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 使用这个方法前注意，对应的module已经加载进bridge里面
+ (RNRootVC *)createRNVCWith:(RNPackageType)type bridge:(RCTBridge *)bridge {
  NSDictionary *params = @{@"deviceSN": @"test_12345", @"lan": @"en"};
  
  NSString *moduleName = [RNPackage moduleNameFor:type];
  RCTRootView *rnView = [[RCTRootView alloc] initWithBridge:bridge moduleName:moduleName initialProperties:params];
  RNRootVC *rootVC = [[RNRootVC alloc] initWithNibName:nil bundle:nil];
  rootVC.view = rnView;
  return rootVC;
}

@end
