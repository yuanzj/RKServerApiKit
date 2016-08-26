//
//  AuthCodeResp.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "AuthCodeData.h"

@interface AuthCodeResponse : BaseResponse

@property(strong, nonatomic) AuthCodeData* data;

@end
