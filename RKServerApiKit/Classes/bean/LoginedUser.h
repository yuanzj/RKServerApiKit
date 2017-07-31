//
//  LoginUser.h
//  Pods
//
//  Created by caoyy on 17/7/20.
//
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface LoginedUser : RLMObject

@property (copy, nonatomic) NSString* nickname;
@property (copy, nonatomic) NSString* openType;
@property (copy, nonatomic) NSString* openId;
@property (copy, nonatomic) NSString* headimgUrl;
@property (copy, nonatomic) NSString* gender;
@property (copy, nonatomic) NSString* province;
@property (copy, nonatomic) NSString* city;
@property (copy, nonatomic) NSString* country;
@property (copy, nonatomic) NSString* token;
@property (copy, nonatomic) NSString* audience;
@property (copy, nonatomic) NSString* created;
@property (copy, nonatomic) NSString* exp;
@property (copy, nonatomic) NSString* roles;
@property (copy, nonatomic) NSString* sub;

@end
