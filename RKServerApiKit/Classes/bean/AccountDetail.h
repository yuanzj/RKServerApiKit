//
//  AccountDetail.h
//  Pods
//
//  Created by caoyy on 2017/8/14.
//
//

#import <Foundation/Foundation.h>

@interface AccountDetail : NSObject

@property (assign, nonatomic) long id;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifyTime;
@property (assign, nonatomic) int version;
@property (strong, nonatomic) NSString* accountNo;
//冻结余额
@property (assign, nonatomic) float balance;
//充值余额
@property (assign, nonatomic) float unlockBalance;
//赠送余额
@property (assign, nonatomic) float virtualBalance;
@property (assign, nonatomic) float unbalance;
@property (assign, nonatomic) float securityMoney;
@property (strong, nonatomic) NSString* status;
@property (assign, nonatomic) int totalIncome;
@property (assign, nonatomic) int totalExpend;
@property (assign, nonatomic) int todayIncome;
@property (assign, nonatomic) int todayExpend;
@property (strong, nonatomic) NSString* accountType;
@property (assign, nonatomic) int settAmount;
@property (strong, nonatomic) NSString* userNo;

@end
