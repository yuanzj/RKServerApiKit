//
//  BetteryDetailResp.h
//  RKServerApiKit
//
//  Created by virgil on 2018/8/14.
//

#import <Foundation/Foundation.h>
#import "GetAuthTokenResp.h"

@interface BetteryDetailResp : NSObject

@property (strong, nonatomic) NSString* sn;
@property (assign, nonatomic) NSInteger status;
@property (assign, nonatomic) float soc;
@property (assign, nonatomic) float voltage;
@property (assign, nonatomic) float current;
@property (assign, nonatomic) float temperature;
@property (strong, nonatomic) NSString* reportTime;
@property (strong, nonatomic) GetAuthTokenError* error;

@end
