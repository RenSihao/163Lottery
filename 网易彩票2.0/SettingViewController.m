//
//  SettingViewController.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/20.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingInfo.h"
#import "SettingCelIData.h"
#import "SettingDetailViewController.h"

@interface SettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    //
    [self.navigationItem setTitle:@"设置"];
    
    //设置返回按钮（呈现在下一个页面）
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    //设置navbar右上角item
    UIButton *rightButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 13)];
    [rightButtonItem setTitle:@"常见问题" forState:UIControlStateNormal];
    [rightButtonItem.titleLabel setFont:NAVBAR_ITEM_FONT];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButtonItem];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    //xxxxx
    self.tabBarController.tabBar.hidden = YES;
}

- (void)backItemDidClick
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
}
- (NSArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [SettingInfo settingInfoPlist];
    }
    return _dataArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] group].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"settingcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    SettingCelIData *cellData = [self.dataArray[indexPath.section] group][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:cellData.icon];
    cell.textLabel.text = cellData.title;
    if((indexPath.section == 1) && (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3))
    {
        cell.accessoryView = [[UISwitch alloc] init];
    }
    return cell;
    
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{

    return UITableViewCellAccessoryDisclosureIndicator;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingDetailViewController *settingDetailVC = [[SettingDetailViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:settingDetailVC animated:YES];
    
    
    
    
}
@end
