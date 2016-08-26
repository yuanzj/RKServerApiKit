//
//  UeDetailBean.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeDetailBean.h"

@implementation UeDetailBean
-(NSString*)description{
    return [NSString stringWithFormat:@"produceDate: %@ buyTime: %@ type: %@ brandName %@ typeName %@ expirationDate %@",_produceDate,_buyTime, _type, _brandName, _typeName, _expirationDate];
}
@end
