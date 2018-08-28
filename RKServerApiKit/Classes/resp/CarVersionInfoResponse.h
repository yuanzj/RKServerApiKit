//
//  CarVersionInfoResponse.h
//  Pods
//
//  Created by caoyy on 17/2/9.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface CCUVersion : NSObject

@property (copy, nonatomic) NSString * ccuFirmwareVersion;
@property (copy, nonatomic) NSString * ccuHardwareVersion;
@property (copy, nonatomic) NSString * ccuActivateTime;

@end

@interface ECUVersion : NSObject

@property (copy, nonatomic) NSString * ecuSn;
@property (copy, nonatomic) NSString * ecuFirmwareVersion;
@property (copy, nonatomic) NSString * ecuHardwareVersion;

@end

@interface DCUVersion : NSObject

@property (copy, nonatomic) NSString * imei;
@property (copy, nonatomic) NSString * dcuHardwareVersion;
@property (copy, nonatomic) NSString * dcuFirmwareVersion;
@property (copy, nonatomic) NSString * dcuActivateTime;

@end

@interface PCUVersion : NSObject

@property (copy, nonatomic) NSString * pcuSn;
@property (copy, nonatomic) NSString * pcuFirmwareVersion;
@property (copy, nonatomic) NSString * pcuHardwareVersion;

@end

@interface BCUVersion : NSObject

@property (copy, nonatomic) NSString * bcuSn;
@property (copy, nonatomic) NSString * bcuFirmwareVersion;
@property (copy, nonatomic) NSString * bcuHardwareVersion;

@end

@interface CarVersionInfo : NSObject

@property (strong, nonatomic) CCUVersion * ccu;
@property (strong, nonatomic) ECUVersion * ecu;
@property (strong, nonatomic) DCUVersion * dcu;
@property (strong, nonatomic) PCUVersion * pcu;
@property (strong, nonatomic) BCUVersion * bcu;

@end

@interface CarVersionInfoResponse : BaseResponse

@property (strong, nonatomic) CarVersionInfo* data6;

@end
