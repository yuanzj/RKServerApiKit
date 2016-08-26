//
//  UpdateHeadResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "HeadImgData.h"

@interface UpdateHeadResponse : BaseResponse

@property (strong, nonatomic) HeadImgData* data;

@end
