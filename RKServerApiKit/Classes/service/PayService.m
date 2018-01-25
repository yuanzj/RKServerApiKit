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

+(NSURLSessionDataTask *)getCategoryListWithBlock:(void (^)(CategoryResp *_PayGoodResp, NSError *error)) block{
    
    return [PayApi getCagetoryListWithBlock:^(CategoryResp *_PayGoodResp, NSError *error) {
        if (_PayGoodResp) {
            
            NSArray* data = _PayGoodResp.page.list;
            [RealmManager clearCategoryList];
            if (data && data.count > 0) {
                [RealmManager saveCategoryList:data];
            }
            
            block(_PayGoodResp, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)createSimChargeOrder:(NSString*)imsi simChargeGoodId:(int)goodId price:(double)price payment:(int)payment block:(void (^)(NSString *orderId, NSError *error)) block{
    
    return [PayApi createSimChargeOrder:imsi simChargeGoodId:goodId price:price payment:payment block:^(NSString *orderId, NSError *error) {
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

+(NSURLSessionDataTask *)getTradePaymentOrders:(NSString*)page limit:(NSString*)limit excludeStatus:(NSString*)excludeStatus block:(void (^)(TradePaymentOrderResp *_TradePaymentOrderResp, NSError *error)) block {
    return [PayApi getTradePaymentOrders:page limit:limit excludeStatus:excludeStatus block:^(TradePaymentOrderResp *_TradePaymentOrderResp, NSError *error) {
        if (_TradePaymentOrderResp) {
            [RealmManager clearTradePaymentOrderList];
            if(_TradePaymentOrderResp && _TradePaymentOrderResp.list && _TradePaymentOrderResp.list.count > 0){
                NSArray *list = _TradePaymentOrderResp.list;
                [RealmManager saveMessageList:list];
            }
            block(_TradePaymentOrderResp, nil);
        } else {
            block(nil, error);
        }
    }];
}

@end
