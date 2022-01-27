//
//  UIBarButtonItem+SCBarButtonItem.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UIBarButtonItem+SCBarButtonItem.h"

@implementation UIBarButtonItem (SCBarButtonItem)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14.f];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
