//
//  PayGood.h
//  Pods
//
//  Created by caoyy on 2017/8/15.
//
//
#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

@interface PayGood : RLMObject

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int version;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* remark;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) double price;

@end
