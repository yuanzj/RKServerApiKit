//
//  TokenResponse.m
//  Pods
//
//  Created by caoyy on 17/4/7.
//
//

#import "TokenResponse.h"
#import "RealmManager.h"

static Token *mToken = nil;
@implementation Token
-(NSString*)description{
    return [NSString stringWithFormat:@"_access_token: %@",_access_token];
}
+ (void)setToken:(Token *)_Token
{
    mToken = _Token;
}
+ (Token *)getToken
{
    if(mToken == nil){
        mToken = [RealmManager queryToken];
    }
    return mToken;
}
@end

@implementation TokenResponse

@end
