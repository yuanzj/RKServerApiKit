//
//  Order.h
//  Pods
//
//  Created by caoyy on 17/7/21.
//
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* startTime;
@property (strong, nonatomic) NSString* endTime;
@property (strong, nonatomic) NSString* ccuSn;
@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) NSString* productId;
@property (strong, nonatomic) NSString* price;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* modifyTime;

@end
