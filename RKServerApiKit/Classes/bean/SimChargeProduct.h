//
//  SimChargeProduct.h
//  RKServerApiKit
//
//  Created by 曹杨漾 on 2017/12/8.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface SimChargeProduct : RLMObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* version;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* remark;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* months;
@property (strong, nonatomic) NSString* desc;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* price;

@end
