//
//  MsgResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "MsgResponse.h"

@implementation MsgResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"resp: %@ data: %@", [super description], _data5];
}
@end
