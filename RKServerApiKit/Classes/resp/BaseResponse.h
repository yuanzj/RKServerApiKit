//
//  BaseResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>


#define RKSAPIResponseSuccess 0

@interface BaseResponse : NSObject

@property (nonatomic,assign ) int      state;
@property (nonatomic,copy   ) NSString * message;

@end
