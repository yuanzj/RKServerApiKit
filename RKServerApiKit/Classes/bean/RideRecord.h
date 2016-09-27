//
//  RideRecord.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import <Realm/Realm.h>

@interface RideRecord : RLMObject

@property (copy, nonatomic) NSString * day;
@property (copy, nonatomic) NSString * startTime;
@property (copy, nonatomic) NSString * endTime;
@property (assign, nonatomic) float distance;
@property (copy, nonatomic) NSString * totalTime;
@property (copy, nonatomic) NSString * startLon;
@property (copy, nonatomic) NSString * startLat;
@property (copy, nonatomic) NSString * endLon;
@property (copy, nonatomic) NSString * endLat;
@property (assign, nonatomic) float highestSpeed;
@property (assign, nonatomic) float averageSpeed;

@end

@interface RideRecordResponse : BaseResponse

@property (strong, nonatomic) NSArray* data5;

@end

RLM_ARRAY_TYPE(RideRecord)
