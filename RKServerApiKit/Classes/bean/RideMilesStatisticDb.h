//
//  RideMilesStatisticDb.h
//  Pods
//
//  Created by caoyy on 17/2/22.
//
//

#import <Realm/Realm.h>
#import "RideMilesStatistic.h"

@interface RideMilesStatisticDb : RLMObject

@property (strong, nonatomic) NSString* ueSn;
@property (strong, nonatomic) RLMArray<RideMilesStatistic>* rideMilesStatistics;

@end
