//
//  FailServerAddress.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FailServerAddress : NSObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* ipAddress;
@property (strong, nonatomic) NSString* port;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* createTime;

@end
