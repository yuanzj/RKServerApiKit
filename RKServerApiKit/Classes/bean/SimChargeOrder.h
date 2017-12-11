//
//  SimChargeOrder.h
//  RKServerApiKit
//
//  Created by 曹杨漾 on 2017/12/8.
//

#import <Foundation/Foundation.h>
#import "SimChargeProduct.h"
#import <Realm/Realm.h>

@interface SimChargeOrder : RLMObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* version;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) NSString* imsi;
@property (strong, nonatomic) NSString* productId;
@property (strong, nonatomic) NSString* price;
@property (strong, nonatomic) NSString* trxNo;
@property (strong, nonatomic) SimChargeProduct* simChargeProductEntity;

@end
