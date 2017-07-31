//
//  WxUserInfo.h
//  Pods
//
//  Created by caoyy on 17/7/20.
//
//

#import <Foundation/Foundation.h>

@interface WxUserInfo : NSObject

@property (strong, nonatomic) NSString* openid;
@property (strong, nonatomic) NSString* nickname;
@property (assign, nonatomic) int sex;
@property (strong, nonatomic) NSString* province;
@property (strong, nonatomic) NSString* city;
@property (strong, nonatomic) NSString* country;
@property (strong, nonatomic) NSString* headimgurl;
@property (strong, nonatomic) NSString* unionid;

@end
