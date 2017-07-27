//
//  ErrorBean.h
//  Pods
//
//  Created by caoyy on 17/7/26.
//
//

#import <Foundation/Foundation.h>

@interface ErrorBean : NSObject

@property (strong, nonatomic) NSString* msg;
@property (strong, nonatomic) NSString* path;
@property (assign, nonatomic) int code;

@end
