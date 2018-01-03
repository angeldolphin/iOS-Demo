//
//  TestViewController.m
//  runtimeDemo
//
//  Created by Jessy on 2018/1/3.
//  Copyright © 2018年 zrm. All rights reserved.
//

#import "TestViewController.h"
#import "UIViewController+hudView.h"

@interface TestViewController ()

@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setUpLoadingInfo];
//    [self loadDataFromCeshi:self.ceshi];
}

- (void)setUpLoadingInfo{
    [self loadingMessageLabel];
    [self hideMessageLabelWithSeconds:0];
}

- (void)loadDataFromCeshi:(NSString *)ceshi{
    NSLog(@"%@",ceshi);
}
@end
