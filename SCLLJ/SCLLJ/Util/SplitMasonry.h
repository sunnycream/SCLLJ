//
//  SplitMasonry.h
//  Orange
//
//  Created by dongdong on 2018/9/7.
//  Copyright © 2018年 dongdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SplitMasonry : NSObject

/**
 *  将若干view等宽布局于容器containerView中
 
 views         viewArray
 containerView 容器view
 LRpadding     距容器的左右边距
 viewPadding   各view的左右边距
 */
+ (void)makeEqualWidthViews:(NSArray *)views inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding  topPadding:(CGFloat)topPadding isPadding:(BOOL)isPadding;

@end
