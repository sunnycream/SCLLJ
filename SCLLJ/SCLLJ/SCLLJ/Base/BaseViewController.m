//
//  BaseViewController.m
//  SCLLJ
//
//  Created by 刘林杰 on 2019/9/17.
//  Copyright © 2019 llj. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD+SCProgressHUD.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    self.view.backgroundColor = [SCUtil colorWithHexString:@"#3E71FF"];
}

- (void)showTextOnly:(NSString *)text {
    if (text.length == 0) {
        return;
    }
    [MBProgressHUD showTextOnly:text];
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
