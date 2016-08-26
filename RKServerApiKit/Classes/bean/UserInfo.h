//
//  UserInfo.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"

@interface UserInfo : NSObject

@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) NSString* nickname;
@property (strong, nonatomic) NSString* headImgUrl;
@property (strong, nonatomic) NSString* mobile;

@end
