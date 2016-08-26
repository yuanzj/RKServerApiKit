//
//  UeDetailResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeDetailResponse.h"

@implementation UeDetailResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"resp: %@ data: %@", [super description], _data];
}
@end
