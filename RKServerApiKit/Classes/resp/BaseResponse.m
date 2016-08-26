//
//  BaseResponse.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"state: %d message: %@",_state,_message];
}
@end
