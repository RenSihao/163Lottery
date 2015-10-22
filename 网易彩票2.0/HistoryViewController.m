//
//  HistoryViewController.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"开奖信息"];
    
    UIButton *rightButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 13)];
    
    [rightButtonItem setTitle:@"开奖推送" forState:UIControlStateNormal];
    [rightButtonItem setTitleColor:NAVBAR_TINT_COLOR forState:UIControlStateNormal];
    [rightButtonItem.titleLabel setFont:NAVBAR_ITEM_FONT];
    [rightButtonItem.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [rightButtonItem setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButtonItem];
    
  
}

@end
