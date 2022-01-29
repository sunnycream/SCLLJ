//
//  MBProgressHUD+SCProgressHUD.m
//  SCLLJ
//
//  Created by 刘林杰 on 2019/9/25.
//  Copyright © 2019 llj. All rights reserved.
//

#import "MBProgressHUD+SCProgressHUD.h"

@implementation MBProgressHUD (SCProgressHUD)

+ (void)showTextOnly:(NSString *)text  {
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
   
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.contentColor = [UIColor whiteColor];//文本颜色
    hud.mode = MBProgressHUDModeText;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.0f alpha:0.2f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;//背景色
    hud.bezelView.color = [UIColor blackColor];
    [hud hideAnimated:YES afterDelay:2.0f];
}

@end
