//
//  SimChargeGood.h
//  RKServerApiKit
//
//  Created by Yuan ZhiJian on 2017/12/8.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface SimChargeGood : RLMObject

@property (assign, nonatomic) long id;
@property (assign, nonatomic) int version;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* remark;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* desc;
@property (assign, nonatomic) double price;
@property (assign, nonatomic) int months;
//"id": 2,
//"version": 0,
//"createTime": "2017-12-06 18:02:28",
//"modifier": null,
//"creator": "system",
//"modifyTime": null,
//"remark": null,
//"category": 0,
//"status": "ENABLE",
//"code": "SIM-CHARGE_002",
//"name": "60元 1年",
//"months": 12,
//"desc": "60元 1年",
//"image": null,
//"price": 0.02

@end
