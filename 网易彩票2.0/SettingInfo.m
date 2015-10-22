//
//  SettingInfo.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/20.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SettingInfo.h"
#import "SettingCelIData.h"

@implementation SettingInfo

+ (instancetype)settingInfoWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}
- (instancetype)initWithArray:(NSArray *)array
{
    if(self = [super init])
    {
       _group = array;
    }
    return self;
}
+ (NSArray *)settingInfoPlist
{
    NSArray *plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"]];
    NSMutableArray *infoArray = [NSMutableArray array];
    for(NSArray *array in plist)
    {
        SettingInfo *settingInfo = [SettingInfo settingInfoWithArray:array];
        
        //内嵌cell数据模型
        NSMutableArray *cellArray = [NSMutableArray array];
        for(NSDictionary *dict in settingInfo.group)
        {
            SettingCelIData *cellData = [SettingCelIData settingCellDataWithDictionary:dict];
            [cellArray addObject:cellData];
        }
        settingInfo.group = cellArray;
        
        
        [infoArray addObject:settingInfo];
    }
    return infoArray;

}
@end
