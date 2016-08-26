//
//  FirmwareVersionResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "FirmwareVersion.h"

@interface FirmwareVersionResponse : BaseResponse

@property (strong, nonatomic) FirmwareVersion* data;
@property (strong, nonatomic) FirmwareVersion* current;

@end
