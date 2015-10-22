//
//  RootViewController.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/17.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "RootViewController.h"

#import "SHNavigationViewController.h"
#import "SHTabBar.h"

#import "LotteryHallViewController.h"
#import "ArenaViewController.h"
#import "DiscoveryViewController.h"
#import "HistoryViewController.h"
#import "MyLotteryViewController.h"

//这是根视图控制器
@interface RootViewController () <SHTabBarDelegate>

@property (nonatomic, strong) SHTabBar *shTabBar;
@end

@implementation RootViewController

- (void)viewDidLoad
{
    NSLog(@"self.view.frame %@", NSStringFromCGRect(self.view.frame));
    NSLog(@"self.tabbar.frame %@", NSStringFromCGRect(self.tabBar.frame));
    
    //设置LaunchImage
    [NSThread sleepForTimeInterval:2.0f];
    
    //对状态栏进行应用级别统一设置
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //自定义的tabbar
    [self.tabBar removeFromSuperview];
    [self.view addSubview:self.shTabBar];
    
    //对系统的navigationbar进行设置
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateNormal];
    
    
    //加载子控制器
    [self initChildViewControllers];
}

#pragma mark - 初始化子控制器
- (void)initChildViewControllers
{
    
    LotteryHallViewController *lotteryHallVC = [[LotteryHallViewController alloc] init];
    //    [lotteryHallVC.tabBarItem setTitle:@"购彩大厅"];
//        [lotteryHallVC.tabBarItem setImage:[UIImage imageNamed:@"TabBar_LotteryHall"]];
//        [lotteryHallVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected"]];
    SHNavigationViewController *lotteryHallNC = [[SHNavigationViewController alloc] initWithRootViewController:lotteryHallVC];
    
    
    ArenaViewController *arenaVC = [[ArenaViewController alloc] init];
    //[arenaVC.tabBarItem setTitle:@"竞技场"];
    //    [arenaVC.tabBarItem setImage:[UIImage imageNamed:@"TabBar_Arena"]];
    //    [arenaVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"TabBar_Arena_selected"]];
    SHNavigationViewController *arenaNC = [[SHNavigationViewController alloc] initWithRootViewController:arenaVC];
    
    
    DiscoveryViewController *discoveryVC = [[DiscoveryViewController alloc] init];
    //[discoveryVC.tabBarItem setTitle:@"发现"];
    //    [discoveryVC.tabBarItem setImage:[UIImage imageNamed:@"TabBar_Discovery"]];
    //    [discoveryVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected"]];
    SHNavigationViewController *discoveryNC = [[SHNavigationViewController alloc] initWithRootViewController:discoveryVC];
    
    
    
    HistoryViewController *historyVC = [[HistoryViewController alloc] init];
    //[historyVC.tabBarItem setTitle:@"开奖信息"];
    //    [historyVC.tabBarItem setImage:[UIImage imageNamed:@"TabBar_History"]];
    //    [historyVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"TabBar_History_selected"]];
    SHNavigationViewController *historyNC = [[SHNavigationViewController alloc] initWithRootViewController:historyVC];
    
    
    MyLotteryViewController *myLotteryVC = [[MyLotteryViewController alloc] init];
    //[myLotteryVC.tabBarItem setTitle:@"我的彩票"];
    //    [myLotteryVC.tabBarItem setImage:[UIImage imageNamed:@"TabBar_MyLottery"]];
    //    [myLotteryVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected"]];
    SHNavigationViewController *myLotteryNC = [[SHNavigationViewController alloc] initWithRootViewController:myLotteryVC];
    
    
    self.viewControllers = @[lotteryHallNC, arenaNC, discoveryNC, historyNC, myLotteryNC];

}

#pragma mark - lazyload
- (SHTabBar *)shTabBar
{
    if(!_shTabBar)
    {
        _shTabBar = [[SHTabBar alloc] initWithFrame:self.tabBar.frame];
        _shTabBar.delegate = self;
    }
    return _shTabBar;
}

#pragma mark - SHTabBarDelegate
- (void)buttonItemDidSelect:(SHTabBar *)tabBar :(UIButton *)button
{
    NSLog(@"%ld", button.tag);
    switch (button.tag) {
        case 0:
        {
            self.selectedViewController = self.viewControllers[0];
        }
            
            break;
        case 1:
        {
            self.selectedViewController = self.viewControllers[1];
        }
            break;
        case 2:
        {
            self.selectedViewController = self.viewControllers[2];
        }
            break;
        case 3:
        {
            self.selectedViewController = self.viewControllers[3];
        }
            break;
        case 4:
        {
            self.selectedViewController = self.viewControllers[4];
        }
            break;
        default:
            break;
    }
    
}




@end
