//
//  PayApi.h
//  Pods
//
//  Created by caoyy on 2017/8/14.
//
//

#import <Foundation/Foundation.h>
#import "AccountDetail.h"
#import "AFAppDotNetAPIClient.h"
#import "PayGoodResp.h"
#import "PayGood.h"
#import "DiscountResp.h"
#import "SimChargeGoodResp.h"
#import "SimChargeGood.h"

@interface PayApi : NSObject

/**
 * 获取账户详情
 */
+(NSURLSessionDataTask *)getAccountDetail:(void (^)(AccountDetail *_AccountDetail, NSError *error)) block;

/**
 * 获取充值产品
 */
+(NSURLSessionDataTask *)getPayGoods:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block;

/**
 * 获取充值产品
 */
+(NSURLSessionDataTask *)getPayGoodsWithBlock:(void (^)(SimChargeGoodResp *_PayGoodResp, NSError *error)) block;


+(NSURLSessionDataTask *)createSimChargeOrder:(NSString*)imsi simChargeGoodId:(int)goodId price:(double)price payment:(int)payment block:(void (^)(NSString *orderId, NSError *error)) block;

/**
 * 获取押金
 */
+(NSURLSessionDataTask *)getDeposit:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block;

/**
 * 获取统一订单
 */
+(NSURLSessionDataTask *)topUpBalance:(NSString*)payChannelId payType:(NSString*)payType payGoodsId:(NSString*)payGoodsId amount:(NSString*)amount salesPromotionId:(NSString*)salesPromotionId block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)payOrder:(NSString*)payChannelId payType:(NSString*)payType orderId:(NSString*)orderId amount:(NSString*)amount good:(NSDictionary*)good block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block;

/**
 * 校验订单支付结果
 */
+(NSURLSessionDataTask *)verifyOrder:(NSString*)payChannelId ordeResult:(NSDictionary*)ordeResult block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 返还押金
 */
+(NSURLSessionDataTask *)refundSecurityMoney:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 获取优惠活动
 */
+(NSURLSessionDataTask *)getSalesPromotions:(void (^)(DiscountResp *_DiscountResp, ErrorResp *errorResp, NSError *error)) block;

@end
