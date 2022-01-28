//
//  CheeseViewController.m
//  SCLLJ
//
//  Created by 刘林杰 on 2022/1/27.
//

#import "CheeseViewController.h"

@interface CheeseViewController ()

@end

@implementation CheeseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 100)];
    bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgView];
    
    NSArray *array = @[@"1", @"2", @"3", @"4", @"5"];
    
    CGFloat space = (kScreenWidth - 20 * array.count) / (array.count + 1);
    
    for (int i = 0; i < array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor greenColor];
        imageView.frame = CGRectMake(space + (space + 20) * i, 40, 20, 20);
//        [bgView addSubview:imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor yellowColor];
//        button.frame = CGRectMake(kScreenWidth / array.count * i, 0, kScreenWidth / array.count, 100);
        button.frame = CGRectMake(imageView.center.x - 10 - 15, imageView.center.y - 10 - 15, 50, 50);
        [bgView addSubview:button];
        [bgView addSubview:imageView];
    }
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
