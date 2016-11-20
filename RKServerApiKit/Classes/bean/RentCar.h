//
//  RentCar.h
//  Pods
//
//  Created by Yuan ZhiJian on 2016/11/18.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface RentCar : NSObject

@property (copy, nonatomic) NSString * ueSn;
@property (copy, nonatomic) NSString * totalMiles;
@property (copy, nonatomic) NSString * remainCapacity;
@property (copy, nonatomic) NSString * todayMiles;
@property (copy, nonatomic) NSString * fault;
@property (copy, nonatomic) NSString * lon;
@property (copy, nonatomic) NSString * lat;
@property (copy, nonatomic) NSString * lonlatType;//0:原始坐标 1：百度坐标

@property (copy, nonatomic) NSString * locationType;//位置来源

@property (copy, nonatomic) NSString * lastLocationTime;
@property (copy, nonatomic) NSString * lastReportTime;
@property (copy, nonatomic) NSString * gpsSatellite;
@property (copy, nonatomic) NSString * currentCarStatus;

@property (copy, nonatomic) NSString * onlineStatus;
@property (copy, nonatomic) NSString * outElecStatus;
@property (copy, nonatomic) NSString * rs485Status;

@property (copy, nonatomic) NSString * rentalStatus;

@property (copy, nonatomic) NSString * remainTime;

@end

@interface RentCarItemResponse : BaseResponse

@property (strong, nonatomic) RentCar* data;

@end
