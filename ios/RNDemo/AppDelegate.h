//
//  AppDelegate.h
//  RNDemo
//
//  Created by hut on 2024/7/9.
//

#import <UIKit/UIKit.h>
#import "RNPackageLoader.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) RNPackageLoader *rnPkgLoader;
@end

