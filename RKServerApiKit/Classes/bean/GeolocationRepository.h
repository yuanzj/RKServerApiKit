//
//  GeolocationRepository.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//
#import <Realm/Realm.h>

@interface GeolocationRepository : RLMObject

@property (copy, nonatomic) NSString * lon;
@property (copy, nonatomic) NSString * lat;

@property (copy, nonatomic) NSString * geolocationInfo;

@end
