//
//  GetUeVersionResponse.h
//  Pods
//
//  Created by caoyy on 17/1/20.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "UeVersion.h"

@interface GetUeVersionResponse : BaseResponse

@property (strong, nonatomic) UeVersion* data;;

@end
