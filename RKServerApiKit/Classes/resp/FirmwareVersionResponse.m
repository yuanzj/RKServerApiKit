//
//  FirmwareVersionResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "FirmwareVersionResponse.h"

@implementation FirmwareVersionResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"resp: %@ data: %@ current: %@", [super description], _data, _current];
}
@end
