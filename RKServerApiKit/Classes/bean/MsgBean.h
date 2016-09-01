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

@property (strong, nonatomic) NSString* uid;
@property (strong, nonatomic) NSString* messageProducer;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* type;
@property (strong, nonatomic) NSString* ueSn;
@property (assign, nonatomic) int status;
@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) NSString* ueType;
@property (strong, nonatomic) NSString* createTime;

@end
