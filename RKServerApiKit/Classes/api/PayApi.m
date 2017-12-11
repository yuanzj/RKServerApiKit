//
//  PayApi.m
//  Pods
//
//  Created by caoyy on 2017/8/14.
//
//

#import "PayApi.h"
#import "DiscountBean.h"

@implementation PayApi

+(NSURLSessionDataTask *)getAccountDetail:(void (^)(AccountDetail *_AccountDetail, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-pay/v3.1/accounts/detail" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                AccountDetail *mAccountDetail = [AccountDetail mj_objectWithKeyValues:JSON];
                if(mAccountDetail){
                    block(mAccountDetail, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getPayGoods:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-order/v3.1/paymoneys" parameters:@{@"sort":(sort ? sort : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                [PayGoodResp mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"list" : [PayGood class]
                             };
                }];
                PayGoodResp *mPayGoodResp = [PayGoodResp mj_objectWithKeyValues:JSON];
                if(mPayGoodResp){
                    block(mPayGoodResp, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getPayGoodsWithBlock:(void (^)(SimChargeGoodResp *_PayGoodResp, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-order/v3.1/simchargeproducts" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                [SimChargeGoodResp mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"list" : [SimChargeGood class]
                             };
                }];
                SimChargeGoodResp *mPayGoodResp = [SimChargeGoodResp mj_objectWithKeyValues:JSON];
                if(mPayGoodResp){
                    block(mPayGoodResp, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
    
}

+(NSURLSessionDataTask *)createSimChargeOrder:(NSString*)imsi simChargeGoodId:(int)goodId price:(double)price block:(void (^)(NSString *orderId, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] POST_JSON_text:@"api-order/v3.1/simchargeorders/" parameters:@{@"imsi":imsi,@"productId":@(goodId),@"price":@(price)} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                block( [[NSString alloc] initWithData:JSON encoding:NSUTF8StringEncoding] , nil);
            } else {
                block(nil, error);
            }
        }
    }];
    
}

+(NSURLSessionDataTask *)getDeposit:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"/api-pay/v3.1/pay-goods" parameters:@{@"sort":(sort ? sort : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                [PayGoodResp mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"list" : [PayGood class]
                             };
                }];
                PayGoodResp *mPayGoodResp = [PayGoodResp mj_objectWithKeyValues:JSON];
                if(mPayGoodResp){
                    block(mPayGoodResp, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)topUpBalance:(NSString*)payChannelId payType:(NSString*)payType payGoodsId:(NSString*)payGoodsId amount:(NSString*)amount salesPromotionId:(NSString*)salesPromotionId block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block {
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"api-pay/v3.1/gateway/top-up-balance" parameters:@{@"payChannelId":(payChannelId ? payChannelId : @""), @"payType":(payType ? payType : @""), @"payGoodsId":(payGoodsId ? payGoodsId : @""), @"amount":(amount ? amount : @""), @"salesPromotionId":(salesPromotionId ? salesPromotionId : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                if (mErrorResp && mErrorResp.error) {
                    block(nil, mErrorResp, error);
                } else {
                    block(JSON, nil, error);
                }
            }else{
                block(nil, nil, error);
            }
        }
    }];

}

+(NSURLSessionDataTask *)payOrder:(NSString*)payChannelId payType:(NSString*)payType orderId:(NSString*)orderId amount:(NSString*)amount good:(NSDictionary*)good block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block{
    
    
//    @Query("payChannelId") Long payChannelId, @Query("payType") String payType, @Query("amount") double amount, @Query("orderId") String orderId, @Body SimChargeProduct productEntity
    
    ;
    
    return [[AFAppDotNetAPIClient sharedClient] POST_JSON:[NSString stringWithFormat:@"api-pay/v3.1/gateway/create-pay-order?payChannelId=%@&payType=%@&amount=%@&orderId=%@",payChannelId,payType,amount,orderId] parameters:good completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                if (mErrorResp && mErrorResp.error) {
                    block(nil, mErrorResp, error);
                } else {
                    block(JSON, nil, error);
                }
            }else{
                block(nil, nil, error);
            }
        }
    }];
    
}

+(NSURLSessionDataTask *)verifyOrder:(NSString*)payChannelId ordeResult:(NSDictionary*)ordeResult block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    NSString* url = [NSString stringWithFormat:@"api-pay/v3.1/gateway/%@/verify-order", payChannelId];
    return [[AFAppDotNetAPIClient sharedClient] POST_JSON:url parameters:ordeResult completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if(block){
            if (responseObject) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:responseObject];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)refundSecurityMoney:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-pay/v3.1/gateway/refund/security-money" parameters:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if(block){
            if (responseObject) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:responseObject];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getSalesPromotions:(void (^)(DiscountResp *_DiscountResp, ErrorResp *errorResp, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-order/v3.1/salespromotions" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                [DiscountResp mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"list" : [DiscountBean class]
                             };
                }];
                DiscountResp *mDiscountResp = [DiscountResp mj_objectWithKeyValues:JSON];
                if (mDiscountResp) {
                    block(mDiscountResp, nil, error);
                } else {
                    ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                    if (mErrorResp) {
                        block(nil, mErrorResp, error);
                    }
                }
            } else {
                block(nil, nil, error);
            }
        }
    }];
}

@end
