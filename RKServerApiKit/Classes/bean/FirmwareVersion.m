//
//  FirmwareVersion.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "FirmwareVersion.h"

@implementation FirmwareVersion
-(NSString*)description{
    return [NSString stringWithFormat:@"createTime: %@ currentVersion: %@ hardwareVersion: %@ id: %@ md5: %@ releaseNote: %@ ueType: %@ upgradeAddress: %@ displayVersion: %@",_createTime,_currentVersion, _hardwareVersion, _id, _md5, _releaseNote, _ueType, _upgradeAddress, _displayVersion];
}
@end
