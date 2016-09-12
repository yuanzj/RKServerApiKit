//
//  CCUDetail.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "CCUDetail.h"

@implementation CCUDetail
-(NSString*)description{
    return [@{@"activeTime":_activeTime,
              @"warrantyTime":_warrantyTime} description];
}
@end

@implementation CCUDetailResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"%@ CCUDetail: %@",[super description], [_data description]];
}
@end