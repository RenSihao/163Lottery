//
//  LotteryHallViewController.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LotteryHallViewController.h"

@interface LotteryHallViewController ()

@end

@implementation LotteryHallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //自定义navbar中间视图
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    titleLab.text = @"网易彩票";
    titleLab.font = NAVBAR_BIGTITLE_FONT;
    titleLab.textColor = NAVBAR_TINT_COLOR;
    titleLab.textAlignment = NSTextAlignmentCenter;
    
    [self.navigationItem setTitleView:titleLab];
    
    
    
}

@end
