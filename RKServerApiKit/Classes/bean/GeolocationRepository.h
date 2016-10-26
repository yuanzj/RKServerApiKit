//
//  GeolocationRepository.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//
#import <Realm/Realm.h>

@interface GeolocationRepository : RLMObject

@property  NSString * lon;
@property  NSString * lat;

@property  NSString * geolocationInfo;

@property  NSDate   * insterDate;

@end

RLM_ARRAY_TYPE(GeolocationRepository)
