//
//  AuthCodeData.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface AuthCodeData : RLMObject

@property (copy, nonatomic) NSString* ueSn;
@property (copy, nonatomic) NSString* cTime;
@property (copy, nonatomic) NSString* eTime;
@property (copy, nonatomic) NSString* code;

@end
