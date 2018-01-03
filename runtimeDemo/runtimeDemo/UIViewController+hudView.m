//
//  UIViewController+hudView.m
//  runtimeDemo
//
//  Created by Jessy on 2018/1/2.
//  Copyright © 2018年 zrm. All rights reserved.
//

#import "UIViewController+hudView.h"
#import <objc/runtime.h>
#import "Masonry.h"
#define MAS_SHORTHAND

@interface UIViewController ()

@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation UIViewController (hudView)

static NSString *messageLabelKey = @"messageLabel";

+ (void)load{
    SEL fromSel = @selector(viewDidLoad);
    SEL toSel = @selector(swizzlingViewDidLoad);
    Method fromMethod = class_getInstanceMethod([self class], fromSel);
    Method toMethod = class_getInstanceMethod([self class], toSel);
   
    if (!class_addMethod([self class], @selector(swizzlingViewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}



#pragma mark - Public Method For Hud
- (void)loadingMessageLabel{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.messageLabel];
//    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
 
}

//  当seconds传入0时，默认2秒后消失
- (void)hideMessageLabelWithSeconds:(int)seconds{
    if (!self.messageLabel) {
        return;
    }
    if (seconds == 0) {
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.messageLabel removeFromSuperview];
        });
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.messageLabel removeFromSuperview];
        });
    }

}
#pragma mark - Public Method For Swizzling
- (void)swizzlingViewDidLoad{
    /*居中的代码
     UISwitch *defaultSwitch = [[UISwitch alloc]init];
     defaultSwitch.center = self.view.center;
     */
    
    UISwitch *defaultSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(130, 120, 10, 10)];
    [defaultSwitch setOn:YES];
    [self.view addSubview:defaultSwitch];
}

#pragma mark - getter
- (UILabel *)messageLabel{
    UILabel *messageLabel = objc_getAssociatedObject(self, &messageLabelKey);
    if (!messageLabel) {
        messageLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-60, [UIScreen mainScreen].bounds.size.height/2-50, 120, 100)];
        messageLabel.text = @"加载中";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        objc_setAssociatedObject(self, &messageLabelKey, messageLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return messageLabel;
}


@end
