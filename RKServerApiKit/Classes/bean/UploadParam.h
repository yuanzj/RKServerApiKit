//
//  UploadParam.h
//  Pods
//
//  Created by Yuan ZhiJian on 2016/11/8.
//
//

#import <Foundation/Foundation.h>

@interface UploadParam : NSObject

//ccSn:'B00G5K0DV5', imei:'860124000267341', lonLagModel :0, lon:38.31, lat:123.01, carStatus:'01', carFault:'00000000000000000000', ve:28, travelMiles:'00000007', voltage:'000125ac', current:' 0585', remainCapacity:'64', uploadTime:'2016-11-01 10:50:00', uploadReason:0
@property (copy, nonatomic) NSString* ccSn;
@property (copy, nonatomic) NSString* imei;
@property (copy, nonatomic) NSString* lonLagModel;
@property (copy, nonatomic) NSString* lon;
@property (copy, nonatomic) NSString* lat;
@property (copy, nonatomic) NSString* carStatus;
@property (copy, nonatomic) NSString* carFault;
@property (copy, nonatomic) NSString* ve;
@property (copy, nonatomic) NSString* travelMiles;
@property (copy, nonatomic) NSString* voltage;
@property (copy, nonatomic) NSString* current;
@property (copy, nonatomic) NSString* remainCapacity;
@property (copy, nonatomic) NSString* soh;
@property (copy, nonatomic) NSString* uploadTime;
@property (copy, nonatomic) NSString* uploadReason;
@property (copy, nonatomic) NSString* horizontalAccuracy;

@end
