//
//  OneDayMiles.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "OneDayMiles.h"

@implementation OneDayMiles
-(NSString*)description{
    return [NSString stringWithFormat:@"startDate: %@ endData: %@ miles: %@",_startDate,_endData, _miles];
}
@end
