//
//  ViewController.m
//  RNDemo
//
//  Created by hut on 2024/7/9.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "RNRootVC.h"
#import "RNNativeTunnel.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.title = @"Home";
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

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

- (IBAction)callJSMethod:(id)sender {
//  [RNNativeTunnel.sharedInstance callJS:@"deivceInfoForSN" params:@{@"sn": @"AAM0000000"}];
  [RNNativeTunnel.sharedInstance callJS:@"setupStationSteps" params:@{@"sn": @"AAM0000000"} success:^(NSDictionary * _Nonnull resDic) {
    [self showAlert:true message:[resDic description]];
  } failure:^(NSString * _Nonnull errorMsg) {
    [self showAlert:false message:errorMsg];
  }];
}

- (void)showAlert:(BOOL)isSuccess message:(NSString *)msg {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSString *title = isSuccess ? @"成功" : @"失败";
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
      [alertVC dismissViewControllerAnimated:true completion:nil];
    }];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:true completion:nil];
  });
}


@end
