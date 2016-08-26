//
//  Common.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/29.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "Common.h"

@implementation Common

+(NSString*)getCurDate{
    NSDate * date = [NSDate date];
    //设置时间输出格式：
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [df stringFromDate:date];
}

@end
