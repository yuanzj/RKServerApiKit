//
//  GeolocationRepository.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "GeolocationRepository.h"

@implementation GeolocationRepository

-(NSString*)key{
    return [NSString stringWithFormat:@"%@%@",self.lon,self.lat];
}
+ (NSString *)primaryKey {
    return @"key";
}

@end
