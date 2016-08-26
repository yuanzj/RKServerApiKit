//
//  FailServerAddress.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "FailServerAddress.h"

@implementation FailServerAddress
-(NSString*)description{
    return [NSString stringWithFormat:@"id: %@ name: %@ ipAddress: %@ port %@ createTime %@",_id,_name, _ipAddress, _port, _createTime];
}
@end
