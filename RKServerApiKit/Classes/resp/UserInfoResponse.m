//
//  UserInfoResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UserInfoResponse.h"

@implementation UserInfoResponse
-(NSString*)description{
    [super description];
    return [NSString stringWithFormat:@"data: %@", _data];
}
@end
