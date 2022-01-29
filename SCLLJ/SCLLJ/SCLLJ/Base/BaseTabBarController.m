//
//  BaseTabBarController.m
//  SCLLJ
//
//  Created by 刘林杰 on 2019/9/17.
//  Copyright © 2019 llj. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "CheeseViewController.h"
#import "CreamViewController.h"
#import "MyViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildControllers];
    
    [[UITabBar appearance] setBarTintColor:[SCUtil colorWithHexString:@"#FFFFFF"]];
    [UITabBar appearance].translucent = NO;
}

- (void)addChildControllers {
    [self setChildControllers:[[CheeseViewController alloc] init] title:@"Cheese"
                  normalImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self setChildControllers:[[CreamViewController alloc] init] title:@"Cream"
                  normalImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self setChildControllers:[[MyViewController alloc] init] title:@"My"
                  normalImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)setChildControllers:(UIViewController *)viewController title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    
//    nav.tabBarItem.title = title;
    nav.tabBarItem.image = normalImage;
    nav.tabBarItem.selectedImage = selectedImage;
    
    viewController.title = title;
    
    [self addChildViewController:nav];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
