//
//  RK600.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessoryUE : NSObject

@property (strong, nonatomic) NSString* ueSn;
@property (strong, nonatomic) NSString* ueType;
@property (strong, nonatomic) NSString* expirationDate;
@property (strong, nonatomic) NSString* simPhone;
@property (strong, nonatomic) NSString* imsi;
@property (strong, nonatomic) NSString* imei;

@end
