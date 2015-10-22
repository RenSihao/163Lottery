//
//  SHTabBar.h
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHTabBar;

@protocol  SHTabBarDelegate <NSObject>

- (void)buttonItemDidSelect:(SHTabBar *)tabBar :(UIButton *)button;

@end

@interface SHTabBar : UIView

@property (nonatomic, strong) id<SHTabBarDelegate> delegate;
@end
