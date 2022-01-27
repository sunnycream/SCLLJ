//
//  UIBarButtonItem+SCBarButtonItem.h
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (SCBarButtonItem)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
