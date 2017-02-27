//
//  CarFaultResponse.h
//  Pods
//
//  Created by caoyy on 17/2/9.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface CarFault : NSObject

@property (strong, nonatomic) NSString* fault;

@end

@interface CarFaultResponse : BaseResponse

@property (strong, nonatomic) CarFault* data;

@end
