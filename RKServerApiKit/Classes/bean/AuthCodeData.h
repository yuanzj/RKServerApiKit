//
//  AuthCodeData.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthCodeData : NSObject

@property (strong, nonatomic) NSString* cTime;
@property (strong, nonatomic) NSString* eTime;
@property (strong, nonatomic) NSString* code;

@end
