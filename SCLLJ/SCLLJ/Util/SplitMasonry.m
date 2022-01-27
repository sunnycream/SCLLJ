//
//  SplitMasonry.m
//  Orange
//
//  Created by dongdong on 2018/9/7.
//  Copyright © 2018年 dongdong. All rights reserved.
//

#import "SplitMasonry.h"

@implementation SplitMasonry

+ (void)makeEqualWidthViews:(NSArray *)views inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding  topPadding:(CGFloat)topPadding isPadding:(BOOL)isPadding {
    UIView *lastView;
    for (UIView *view in views) {
        [containerView addSubview:view];
         UIView *line = [[UIView alloc] init];
        if (isPadding) {
            line.backgroundColor = [SCUtil colorWithHexString:@"#3E5186"];
            [containerView addSubview:line];
        }
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(containerView);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
                make.top.equalTo(containerView).offset(topPadding);
            }];
            if (isPadding) {
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view).offset(0.5);
                    make.centerY.equalTo(view.mas_centerY);
                    make.size.mas_offset(CGSizeMake(0.5, 40));
                    
                }];
            }
        } else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.bottom.equalTo(containerView);
                make.top.equalTo(containerView).offset(topPadding);
            }];
        }
        lastView = view;
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
}

@end
