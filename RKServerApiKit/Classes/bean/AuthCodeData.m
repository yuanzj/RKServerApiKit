//
//  AuthCodeData.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "AuthCodeData.h"

@implementation AuthCodeData

+ (NSString *)primaryKey {
    return @"ueSn";
}

-(NSString*)description{
    return [NSString stringWithFormat:@"cTime: %@ eTime: %@ code: %@", _cTime,_eTime, _code];
}
@end
