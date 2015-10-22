//
//  MyLotteryViewController.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MyLotteryViewController.h"
#import "SettingViewController.h"

@interface MyLotteryViewController ()

//@property (nonatomic, strong) UIBarButtonItem *rightButtonItem;
@end

@implementation MyLotteryViewController

- (void)viewDidLoad
{
    
    
    
    self.navigationItem.title = @"我的彩票";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"SettingWhite@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemDidClick)];
    //设置返回按钮（呈现在下一个页面）
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableTexture"]];
    
}



#pragma mark - 

- (void)settingItemDidClick
{
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}


@end
