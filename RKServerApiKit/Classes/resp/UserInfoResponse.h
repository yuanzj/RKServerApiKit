//
//  UserInfoResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"
#import "UserInfo.h"

@interface UserInfoResponse : BaseResponse

@property (strong, nonatomic) UserInfo* data;

@end
