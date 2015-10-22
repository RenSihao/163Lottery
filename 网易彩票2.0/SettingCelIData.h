//
//  SettingCelIData.h
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/20.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingCelIData : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;

+ (instancetype)settingCellDataWithDictionary:(NSDictionary *)dict;
@end
