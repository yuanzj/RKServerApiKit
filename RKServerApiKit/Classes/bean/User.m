//
//  User.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "User.h"
#import "RealmManager.h"

static User *mUser = nil;
@implementation User
-(NSString*)description{
    return [NSString stringWithFormat:@"_sessionId: %@",_sessionId];
}
+ (void)setUser:(User *)_User
{
    mUser = _User;
}
+ (User *)getUser
{
    if(mUser == nil){
        mUser = [RealmManager queryUser];
    }
    return mUser;
}
@end

@implementation LoginUser
-(NSString*)description{
    return [NSString stringWithFormat:@"_sessionId: %@",_sessionId];
}
@end

@implementation UserResponse
-(NSString*)description{
    [super description];
    return [NSString stringWithFormat:@"user: %@", _data];
}
@end
