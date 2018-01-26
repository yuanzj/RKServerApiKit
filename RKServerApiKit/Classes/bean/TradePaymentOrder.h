//
//  TradePaymentOrder.h
//  RKServerApiKit
//
//  Created by 曹杨漾 on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface TradePaymentOrder : RLMObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* version;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* productCode;
@property (strong, nonatomic) NSString* merchantOrderNo;
@property (strong, nonatomic) NSString* orderAmount;
@property (strong, nonatomic) NSString* orderFrom;
@property (strong, nonatomic) NSString* merchantNo;
@property (strong, nonatomic) NSString* accountNo;
@property (strong, nonatomic) NSString* orderTime;
@property (strong, nonatomic) NSString* orderDate;
@property (strong, nonatomic) NSString* orderIp;
@property (strong, nonatomic) NSString* orderRefererUrl;
@property (strong, nonatomic) NSString* returnUrl;
@property (strong, nonatomic) NSString* notifyUrl;
@property (strong, nonatomic) NSString* cancelReason;
@property (strong, nonatomic) NSString* orderPeriod;
@property (strong, nonatomic) NSString* expireTime;
@property (strong, nonatomic) NSString* payWayCode;
@property (strong, nonatomic) NSString* payWayName;
@property (strong, nonatomic) NSString* remark;
@property (strong, nonatomic) NSString* trxType;
@property (strong, nonatomic) NSString* trxNo;
@property (strong, nonatomic) NSString* payTypeCode;
@property (strong, nonatomic) NSString* payTypeName;
@property (strong, nonatomic) NSString* fundIntoType;
@property (strong, nonatomic) NSString* isRefund;
@property (strong, nonatomic) NSString* refundTimes;
@property (strong, nonatomic) NSString* successRefundAmount;
@property (strong, nonatomic) NSString* payChannelId;
@property (strong, nonatomic) NSString* orderId;
@property (strong, nonatomic) NSString* salesPromotionId;
@property (strong, nonatomic) NSString* settleRecordId;
@property (strong, nonatomic) NSString* productName;
@property (strong, nonatomic) NSString* merchantNoDesc;

@end
