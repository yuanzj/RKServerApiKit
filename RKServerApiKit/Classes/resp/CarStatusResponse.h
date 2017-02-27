//
//  CarStatusResponse.h
//  Pods
//
//  Created by apple on 16/9/18.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
//NS_ENUM，定义状态等普通枚举
typedef NS_ENUM(NSUInteger, CurrentCarStatus) {
    CarStatus_Fortification   = 0x0,
    CarStatus_Disarming       = 0x01,
    CarStatus_P               = 0x02,
    CarStatus_D               = 0x03,
    CarStatus_SERVICE_DISABLE = 0x04,
    CarStatus_485_Disconnect  = 0xF1,
    CarStatus_POWER_OFF       = 0xF2,
};

//设防
//0x0
//车辆处于防盗状态，此时485通信正常
//撤防
//0X01
//设备处于撤防状态，RS485通信正常
//驻车
//0X02
//车辆上电，但无法骑行
//骑行
//0X03
//车辆处于可骑行状态
//服务未启动
//0X20
//服务未开启或SIM
//外电在RS485失联
//0XF1
//DCU和CCU失去联系
//外电不在
//0XF2
//整体断开连接

@interface CarStatus : NSObject

//totalMiles 总里程
//remainCapacity 剩余电量
//todayMiles 今日里程
//fault 故障
//lon 经度
//lat 纬度
//lastReportTime 最后上报时间
//gpsSatellite 卫星数量
//currentCarStatus


@property (copy, nonatomic) NSString * totalMiles;
@property (copy, nonatomic) NSString * remainCapacity;
@property (copy, nonatomic) NSString * soh;
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

@property (copy, nonatomic) NSString * horizontalAccuracy;


@end

@interface CarStatusResponse : BaseResponse

@property (strong, nonatomic) CarStatus* data;

@end
