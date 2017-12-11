//
//  PayService.h
//  Pods
//
//  Created by caoyy on 2017/8/14.
//
//

#import <Foundation/Foundation.h>
#import "AccountDetail.h"
#import "PayGoodResp.h"
#import "ErrorResp.h"
#import "DiscountResp.h"
#import "SimChargeGoodResp.h"

@interface PayService : NSObject

+(NSURLSessionDataTask *)getAccountDetail:(void (^)(AccountDetail *_AccountDetail, NSError *error)) block;

+(NSURLSessionDataTask *)getPayGoods:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block;

+(NSURLSessionDataTask *)getSimChargeGoodsWithBlock:(void (^)(SimChargeGoodResp *_PayGoodResp, NSError *error)) block;

+(NSURLSessionDataTask *)createSimChargeOrder:(NSString*)imsi simChargeGoodId:(int)goodId price:(double)price block:(void (^)(NSString *orderId, NSError *error)) block;

+(NSURLSessionDataTask *)getDeposit:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block;

+(NSURLSessionDataTask *)topUpBalance:(NSString*)payChannelId payType:(NSString*)payType payGoodsId:(NSString*)payGoodsId amount:(NSString*)amount salesPromotionId:(NSString*)salesPromotionId block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)payOrder:(NSString*)payChannelId payType:(NSString*)payType orderId:(NSString*)orderId amount:(NSString*)amount good:(NSDictionary*)good block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)verifyOrder:(NSString*)payChannelId ordeResult:(NSDictionary*)ordeResult block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)refundSecurityMoney:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)getSalesPromotions:(void (^)(DiscountResp *_DiscountResp, ErrorResp *errorResp, NSError *error)) block;

@end
