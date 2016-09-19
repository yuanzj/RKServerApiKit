//
//  MsgBean.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface MsgBean : RLMObject

@property (copy ,nonatomic) NSString *id;

@property (copy, nonatomic) NSString* messageType;

@property (copy, nonatomic) NSString* content;

@property (copy, nonatomic) NSString* createTime;

@end
