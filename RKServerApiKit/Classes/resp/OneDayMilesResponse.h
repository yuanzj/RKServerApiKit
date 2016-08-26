//
//  OneDayMilesResp.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"
#import "OneDayMiles.h"

@interface OneDayMilesResponse : BaseResponse
@property (strong, nonatomic) OneDayMiles* data;
@end
