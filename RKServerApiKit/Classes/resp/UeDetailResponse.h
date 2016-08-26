//
//  UeDetailResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "UeDetailBean.h"

@interface UeDetailResponse : BaseResponse

@property (strong, nonatomic) UeDetailBean* data;

@end
