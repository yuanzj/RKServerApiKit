//
//  RealmManager.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/25.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface RealmManager : NSObject

+ (void)saveUser:(User *)_User;

+ (void)clearUser;

+ (User*)queryUser;

@end
