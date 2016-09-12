//
//  RideRecordDetail.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface RideRecordDetail : NSObject

//time:时间
//lon:经度
//lat:纬度
//speed:速度
@property (copy, nonatomic) NSString * time;
@property (copy, nonatomic) NSString * lon;
@property (copy, nonatomic) NSString * lat;
@property (copy, nonatomic) NSString * speed;

@end

@interface RideRecordDetailResponse : BaseResponse

@property (strong, nonatomic) NSArray* data5;

@end
