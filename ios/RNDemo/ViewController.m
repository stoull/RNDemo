//
//  ViewController.m
//  RNDemo
//
//  Created by hut on 2024/7/9.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "RNRootVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.title = @"Home";
}

- (IBAction)showNativeVC:(UIButton *)sender {
  [self performSegueWithIdentifier:@"showNativeVC" sender:self];
}

- (IBAction)showRNModuleVC:(UIButton *)sender {
  AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"HH:mm:ss"];
  NSString *str1 = [formatter stringFromDate: [NSDate date]];
  
  NSLog(@"开始加载RN包 Common: %@", str1);
  [appDelegate.rnPkgLoader loadPkgWith:RNPackageTypeBusiness];
  NSString *str2 = [formatter stringFromDate: [NSDate date]];
  NSLog(@"加载RN包结束 Common: %@", str2);
  
  RNRootVC *rnRoot = [RNRootVC createRNVCWith:RNPackageTypeBusiness bridge:appDelegate.rnPkgLoader.bridge];
  [self.navigationController pushViewController:rnRoot animated:true];
}

- (IBAction)callRNModuleMethod:(UIButton *)sender {
  
  
  
  AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"HH:mm:ss"];
  NSString *str1 = [formatter stringFromDate: [NSDate date]];
  
  NSLog(@"开始加载RN包 ShineToolsKit: %@", str1);
  [appDelegate.rnPkgLoader loadPkgWith:RNPackageTypeShineToolsKit];
  NSString *str2 = [formatter stringFromDate: [NSDate date]];
  NSLog(@"加载RN包结束 ShineToolsKit: %@", str2);

}


@end
