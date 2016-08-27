//
//  RKSByteConvert.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKSByteConvert : NSObject
+ (int) bytesToUint:(Byte[]) array ;
+ (int) bytesToUshort:(Byte[]) b offset:(int) offset;
+ (int) bytesToUshort:(Byte[]) b;
+ (int) getBitValue:(int) num index:( int) index;

+ (NSData*) intToBytes:(int) n;
+ (NSData*) shortToBytes:(int) n;

@end
