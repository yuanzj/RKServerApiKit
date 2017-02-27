//
//  CarVersionParams.h
//  Pods
//
//  Created by caoyy on 17/2/9.
//
//

#import <Foundation/Foundation.h>

@interface CCUV : NSObject

@property (copy, nonatomic) NSString * ccuFirmwareVersion;
@property (copy, nonatomic) NSString * ccuHardwareVersion;
@property (copy, nonatomic) NSString * ccuActivateTime;

@end

@interface ECUV : NSObject

@property (copy, nonatomic) NSString * ecuSn;
@property (copy, nonatomic) NSString * ecuFirmwareVersion;
@property (copy, nonatomic) NSString * ecuHardwareVersion;

@end

@interface PCUV : NSObject

@property (copy, nonatomic) NSString * pcuSn;
@property (copy, nonatomic) NSString * pcuFirmwareVersion;
@property (copy, nonatomic) NSString * pcuHardwareVersion;

@end

@interface CarVersionParams : NSObject

@property (strong, nonatomic) CCUV * ccu;
@property (strong, nonatomic) ECUV * ecu;
@property (strong, nonatomic) PCUV * pcu;

@end
