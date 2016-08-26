//
//  UserInfo.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

-(NSString*)description{
    return [NSString stringWithFormat:@"gender: %@ nickname: %@ headImgUrl: %@ mobile %@",_gender,_nickname, _headImgUrl, _mobile];
}

@end
