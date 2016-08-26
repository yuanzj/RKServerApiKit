//
//  FirmwareVersion.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirmwareVersion : NSObject
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* currentVersion;
@property (strong, nonatomic) NSString* hardwareVersion;
@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* md5;
@property (strong, nonatomic) NSString* releaseNote;
@property (strong, nonatomic) NSString* ueType;
@property (strong, nonatomic) NSString* upgradeAddress;
@property (strong, nonatomic) NSString* displayVersion;
@end
