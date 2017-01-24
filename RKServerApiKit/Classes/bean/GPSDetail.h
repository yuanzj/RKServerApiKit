//
//  GPSDetail.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface GPSDetail : NSObject
//IMEI
//activeTime 激活时间
//warrantyTime 保修到期日
//gpsBattery gps电池
//gpsSignal gps信号
//gpsSatellite 卫星数量
//onlineStatus 在线状态 0 在线 1 离线
//lastReportTime 最后上报时间
//simPhone sim卡号
//imsi
//totalFlow 当月总流量
//usedFlow 当月使用流量
//expireDate 服务到期日
//1.GPS设备外电状态  -> outElecStatus
//2.ICCID  ->  ICCID


@property (copy, nonatomic) NSString* IMEI;
@property (copy, nonatomic) NSString* iccid;
@property (copy, nonatomic) NSString* outElecStatus;
@property (copy, nonatomic) NSString* rs485Status;
@property (copy, nonatomic) NSString* activeTime;
@property (copy, nonatomic) NSString* warrantyTime;
@property (copy, nonatomic) NSString* gpsBattery;
@property (copy, nonatomic) NSString* gpsSignal;
@property (copy, nonatomic) NSString* gpsSatellite;
@property (copy, nonatomic) NSString* onlineStatus;
@property (copy, nonatomic) NSString* lastReportTime;
@property (copy, nonatomic) NSString* simPhone;
@property (copy, nonatomic) NSString* imsi;
@property (copy, nonatomic) NSString* totalFlow;
@property (copy, nonatomic) NSString* usedFlow;
@property (copy, nonatomic) NSString* expireDate;

@property (copy, nonatomic) NSString* serviceStatus;

@property (copy, nonatomic) NSString* dtuSoftwareVersion;

@property (copy, nonatomic) NSString* dtuHardwareVersion;

@end

@interface GPSDetailResponse : BaseResponse

@property (strong, nonatomic) GPSDetail* data;

@end
