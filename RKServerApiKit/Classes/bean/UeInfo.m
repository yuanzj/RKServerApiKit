//
//  UeInfo.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeInfo.h"

@implementation UeInfo

-(void)setAccessoryUEs:(NSArray*)__AccessoryUEs{
    _accessoryUEs = __AccessoryUEs;
    
    [self.storeAccessoryUEs addObjects:_accessoryUEs];
}

+ (NSString *)primaryKey {
    return @"ueSn";
}
+ (NSArray *)ignoredProperties {
    return @[@"accessoryUEs"];
}
@end
