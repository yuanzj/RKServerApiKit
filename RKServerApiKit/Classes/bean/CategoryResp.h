//
//  Category.h
//  RKServerApiKit
//
//  Created by Yuan ZhiJian on 2018/1/19.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RkCategory : RLMObject
//"id": 1,
//"version": 0,
//"createTime": "2018-01-19 09:57:16",
//"modifier": null,
//"creator": "system",
//"modifyTime": null,
//"remark": null,
//"category": 0,
//"status": "ENABLE",
//"code": "C-BX",
//"name": "保险产品",
//"desc": "保险产品",
//"image": "http://cjl3.rokyinfo.net/res/category-pics/category-ins.png",
//"url": "http://cjl3.rokyinfo.net/index.html"

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int version;
@property (strong, nonatomic) NSString* createTime;
@property (strong, nonatomic) NSString* modifier;
@property (strong, nonatomic) NSString* creator;
@property (strong, nonatomic) NSString* modifyTime;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* desc;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* url;

@end

@interface CategoryPage : NSObject

@property (strong, nonatomic) NSArray* list;

@end

@interface CategoryResp : NSObject

@property (strong, nonatomic) CategoryPage* page;

@end
