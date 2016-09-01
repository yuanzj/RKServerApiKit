//
//  MsgBean.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "MsgBean.h"

@implementation MsgBean

-(NSString*)description{
    return [NSString stringWithFormat:@"uid: %@ messageProducer: %@ url: %@ type %@ ueSn %@ content %@ ueType %@ createTime %@ status %@",_uid,_messageProducer, _url, _type, _ueSn, _content, _ueType, _createTime, @(_status)];
}

+ (NSString *)primaryKey {
    return @"uid";
}

@end
