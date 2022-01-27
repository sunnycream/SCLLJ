//
//  AppDelegate.m
//  SCLLJ
//
//  Created by 刘林杰 on 2022/1/27.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BaseTabBarController *vc = [[BaseTabBarController alloc] init];
    self.window.rootViewController = vc;
    
//    self.window.rootViewController = [RootModel rootViewController];
    
    [self.window makeKeyAndVisible];
    
//    [IQKeyboardManager sharedManager].enable = YES;
    
    return YES;
}


@end
