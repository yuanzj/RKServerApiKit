//
//  ExtendCCResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "ExtendCCResponse.h"

@implementation ExtendCCResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"resp: %@ data: %@", [super description], _data];
}
@end
