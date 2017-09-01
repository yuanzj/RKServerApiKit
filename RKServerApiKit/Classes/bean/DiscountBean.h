//
//  DiscountBean.h
//  Pods
//
//  Created by caoyy on 2017/8/25.
//
//

#import <Foundation/Foundation.h>

@interface DiscountBean : NSObject

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int version;
@property (copy, nonatomic) NSString* createTime;
@property (copy, nonatomic) NSString* creator;
@property (copy, nonatomic) NSString* remark;
@property (assign, nonatomic) float enableAmount;
@property (assign, nonatomic) float giveBalance;

@end
