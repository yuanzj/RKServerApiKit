//
//  Validator.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/29.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "Validator.h"
#import "User.h"

@implementation Validator

+(id)getValidSessionId{
    User *_mUser = [User getUser];
    if (_mUser) {
        return _mUser.sessionId;
    }else{
        return [NSError errorWithDomain:@"interface service" code:0 userInfo:@{NSLocalizedDescriptionKey: @"用户未登录"}];
    }
}

@end
