//
//  SettingInfo.h
//  网易彩票2.0
//
//  Created by RenSihao on 15/10/20.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingInfo : NSObject

@property (nonatomic, strong) NSArray *group;

+ (instancetype)settingInfoWithArray:(NSArray *)array;
- (instancetype)initWithArray:(NSArray *)array;
+ (NSArray *)settingInfoPlist;
@end
