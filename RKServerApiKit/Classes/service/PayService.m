//
//  PayService.m
//  Pods
//
//  Created by caoyy on 2017/8/14.
//
//

#import "PayService.h"
#import "PayApi.h"

@implementation PayService

+(NSURLSessionDataTask *)getAccountDetail:(void (^)(AccountDetail *_AccountDetail, NSError *error)) block {
    return [PayApi getAccountDetail:block];
}

+(NSURLSessionDataTask *)getPayGoods:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block {
    return [PayApi getPayGoods:sort block:^(PayGoodResp *_PayGoodResp, NSError *error) {
        if (_PayGoodResp) {
            
            NSArray* data = _PayGoodResp.list;
            [RealmManager clearPaygoodList];
            if (data && data.count > 0) {
                [RealmManager savePaygoodList:data];
            }
            
            block(_PayGoodResp, nil);
        } else {
            block(nil, error);
        }
    }];
}
+(NSURLSessionDataTask *)getSimChargeGoodsWithBlock:(void (^)(SimChargeGoodResp *_PayGoodResp, NSError *error)) block{
    
    return [PayApi getPayGoodsWithBlock:^(SimChargeGoodResp *_PayGoodResp, NSError *error) {
        if (_PayGoodResp) {
            
            NSArray* data = _PayGoodResp.list;
            [RealmManager clearSimChargeGoodList];
            if (data && data.count > 0) {
                [RealmManager saveSimChargeGoodList:data];
            }
            
            block(_PayGoodResp, nil);
        } else {
            block(nil, error);
        }
    }];
    
}
+(NSURLSessionDataTask *)createSimChargeOrder:(NSString*)imsi simChargeGoodId:(int)goodId price:(double)price block:(void (^)(NSString *orderId, NSError *error)) block{
    
    return [PayApi createSimChargeOrder:imsi simChargeGoodId:goodId price:price block:^(NSString *orderId, NSError *error) {
        if (orderId) {
            block(orderId, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)getDeposit:(NSString*)sort block:(void (^)(PayGoodResp *_PayGoodResp, NSError *error)) block {
    return [PayApi getDeposit:sort block:^(PayGoodResp *_PayGoodResp, NSError *error) {
        if (_PayGoodResp) {
            
            NSArray* data = _PayGoodResp.list;
            [RealmManager clearPaygoodList];
            if (data && data.count > 0) {
                [RealmManager savePaygoodList:data];
            }
            
            block(_PayGoodResp, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)topUpBalance:(NSString*)payChannelId payType:(NSString*)payType payGoodsId:(NSString*)payGoodsId amount:(NSString*)amount salesPromotionId:(NSString*)salesPromotionId block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block {
    return [PayApi topUpBalance:payChannelId payType:payType payGoodsId:payGoodsId amount:amount salesPromotionId:salesPromotionId block:^(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error) {
        block(_orderInfo, errorResp, nil);
    }];
}

+(NSURLSessionDataTask *)payOrder:(NSString*)payChannelId payType:(NSString*)payType orderId:(NSString*)orderId amount:(NSString*)amount good:(NSDictionary*)good block:(void (^)(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error)) block{
    
    return [PayApi payOrder:payChannelId payType:payType orderId:orderId amount:amount good:good block:^(NSDictionary *_orderInfo, ErrorResp *errorResp, NSError *error) {
        block(_orderInfo, errorResp, nil);
    }];
}

+(NSURLSessionDataTask *)verifyOrder:(NSString*)payChannelId ordeResult:(NSDictionary*)ordeResult block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [PayApi verifyOrder:payChannelId ordeResult:ordeResult block:^(NSURLResponse *response, ErrorResp *errorResp, NSError *error) {
         block(response, errorResp, error);
    }];
}

+(NSURLSessionDataTask *)refundSecurityMoney:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [PayApi refundSecurityMoney:block];
}

+(NSURLSessionDataTask *)getSalesPromotions:(void (^)(DiscountResp *_DiscountResp, ErrorResp *errorResp, NSError *error)) block {
    return [PayApi getSalesPromotions:block];
}

@end
