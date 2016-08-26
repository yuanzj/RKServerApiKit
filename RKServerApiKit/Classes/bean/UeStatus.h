//
//  UeStatus.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UeStatus : NSObject

@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* isOnline;
@property (strong, nonatomic) NSString* locationTime;
@property (assign, nonatomic) NSInteger status;

@end
