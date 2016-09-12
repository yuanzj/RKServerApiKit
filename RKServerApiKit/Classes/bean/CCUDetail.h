//
//  CCUDetail.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface CCUDetail : NSObject
//activeTime 激活时间
//warrantyTime 保修到期日
@property (copy, nonatomic) NSString* activeTime;
@property (copy, nonatomic) NSString* warrantyTime;

@end

@interface CCUDetailResponse : BaseResponse

@property (strong, nonatomic) CCUDetail* data;

@end