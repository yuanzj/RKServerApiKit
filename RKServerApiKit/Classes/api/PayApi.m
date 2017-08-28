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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-pay/v3.1/pay-goods" parameters:@{@"sort":(sort ? sort : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
                if (mErrorResp) {
                    block(nil, mErrorResp, nil);
                } else {
                    block(JSON, nil, nil);
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
