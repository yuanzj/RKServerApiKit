//
//  Firm.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"
#import <Realm/Realm.h>

@interface Firm  : RLMObject

//厂商id
@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* brandLogo;
//设备所属品牌
@property (strong, nonatomic) NSString* brandName;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* companyLogo;
@property (strong, nonatomic) NSString* companyName;
@property (strong, nonatomic) NSString* flag;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* number;
@property (strong, nonatomic) NSString* remark;
// 设备所属品牌厂商的url
@property (strong, nonatomic) NSString* url;

@end

