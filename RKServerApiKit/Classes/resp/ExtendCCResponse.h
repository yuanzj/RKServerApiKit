//
//  ExtendCCResponse.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "ExtendCCBean.h"

@interface ExtendCCResponse : BaseResponse
    @property (strong, nonatomic) ExtendCCBean* data;
@end
