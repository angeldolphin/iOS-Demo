//
//  ViewController.m
//  runtimeDemo
//
//  Created by Jessy on 2018/1/2.
//  Copyright © 2018年 zrm. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+hudView.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpLoadingInfo];
}

- (void)setUpLoadingInfo{
    [self loadingMessageLabel];
    [self hideMessageLabelWithSeconds:0];
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)test:(id)sender {
    TestViewController *testVc = [[TestViewController alloc]init];
    testVc.ceshi = @"122222";
    [self.navigationController pushViewController:testVc animated:YES];
}


@end
