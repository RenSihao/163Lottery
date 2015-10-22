//
//  SHTabBar.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHTabBar.h"

@interface SHTabBar ()

@property (nonatomic, strong) NSMutableArray *buttonItems;
@property (nonatomic, strong) UIButton *selectedButtonItem;
@end

@implementation SHTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor blackColor]];
        [self initButtonItems];
        
    }
    return self;
}

- (void)initButtonItems
{
    NSArray *normalImages = @[@"TabBar_LotteryHall", @"TabBar_Arena", @"TabBar_Discovery", @"TabBar_History", @"TabBar_MyLottery"];
    NSArray *selectedImages = @[@"TabBar_LotteryHall_selected", @"TabBar_Arena_selected", @"TabBar_Discovery_selected", @"TabBar_History_selected", @"TabBar_MyLottery_selected"];
    
    CGFloat itemWidth = self.frame.size.width / 5;
    CGFloat itemHeight = self.frame.size.height;
    
    for(NSInteger  i=0; i<5; i++)
    {
        UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
       
        
        //设置frame
        CGFloat itemX = 0 + i*itemWidth;
        CGFloat itemY = 0;
        buttonItem.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
        
        //设置背景图片
        [buttonItem setBackgroundImage:[UIImage imageNamed:normalImages[i]] forState:UIControlStateNormal];
        [buttonItem setBackgroundImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
        
        //添加按钮响应事件
        [buttonItem setTag:i];
        [buttonItem addTarget:self action:@selector(buttonItemDidClick:) forControlEvents:UIControlEventTouchUpInside ];

        if(i == 0)
            buttonItem.selected = YES;
        
        [self.buttonItems addObject:buttonItem];
        [self addSubview:buttonItem];
        
        
    }
    
}

- (NSMutableArray *)buttonItems
{
    if(!_buttonItems)
    {
        _buttonItems = [NSMutableArray arrayWithCapacity:5];
    }
    return _buttonItems;
}
- (UIButton *)selectedButtonItem
{
    if(!_selectedButtonItem)
    {
        _selectedButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _selectedButtonItem;
}
//响应事件
- (void)buttonItemDidClick:(UIButton *)sender
{
    for(UIButton *buttonItem in self.buttonItems)
    {
        buttonItem.selected = NO;
    }
    self.selectedButtonItem = sender;
    self.selectedButtonItem.selected = YES;
    
    if([self.delegate respondsToSelector:@selector(buttonItemDidSelect::)])
    {
        [self.delegate buttonItemDidSelect:self :sender];
    }
}






@end
