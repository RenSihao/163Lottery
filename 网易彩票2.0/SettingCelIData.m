//
//  SettingCelIData.m
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/20.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SettingCelIData.h"

@implementation SettingCelIData
+ (instancetype)settingCellDataWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
