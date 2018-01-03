//
//  UIViewController+hudView.h
//  runtimeDemo
//
//  Created by Jessy on 2018/1/2.
//  Copyright © 2018年 zrm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (hudView)

- (void)loadingMessageLabel;
- (void)hideMessageLabelWithSeconds:(int)seconds;

@end
