//
//  NSModel.h
//  Enjoyment
//
//  Created by zzj on 16/12/9.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class NSModelData;
@class NSItemImage;

@protocol NSItems;
@protocol NSAdditionalField;

@interface NSModel : JSONModel

@property (nonatomic, strong)NSModelData<Optional> *data;
@property (nonatomic, copy)NSString<Optional> *rs_code;

@end

@interface NSModelData : JSONModel

@property (nonatomic, assign)NSInteger count;
@property (nonatomic, strong)NSArray<Optional,NSItems> *items;

@end

@interface NSItems : JSONModel

@property (nonatomic, copy)NSString<Optional> *active_time;
@property (nonatomic, strong)NSArray<Optional> *activity_tag;
@property (nonatomic, strong)NSArray<Optional,NSAdditionalField> *additional_field;

@property (nonatomic, copy)NSString<Optional> *address;
@property (nonatomic, copy)NSString<Optional> *attention;
@property (nonatomic, copy)NSString<Optional> *consumption_per_person;

@property (nonatomic, copy)NSString<Optional> *coordinate;
@property (nonatomic, copy)NSString<Optional> *desc;
@property (nonatomic, copy)NSString<Optional> *detail_url;

@property (nonatomic, assign)NSInteger distance;
@property (nonatomic, assign)NSInteger end_time;
@property (nonatomic, assign)NSInteger NSId;

@property (nonatomic, strong)NSItemImage<Optional> *image;
@property (nonatomic, strong)NSArray<Optional> *kinds;
@property (nonatomic, copy)NSString<Optional> *name;

@property (nonatomic, copy)NSString<Optional> *phone;
@property (nonatomic, assign)NSInteger read_count;
@property (nonatomic, copy)NSString<Optional> *share_url;

@property (nonatomic, assign)NSInteger start_time;
@property (nonatomic, assign)NSInteger status;
@property (nonatomic, assign)NSInteger type;

@end

@interface NSAdditionalField : JSONModel

@property (nonatomic, copy)NSString<Optional> *key;
@property (nonatomic, assign)NSInteger length;
@property (nonatomic, copy)NSString<Optional> *name;
@property (nonatomic, assign)NSInteger type;

@end

@interface NSItemImage : JSONModel

@property (nonatomic, assign)NSInteger height;
@property (nonatomic, copy)NSString<Optional> *url;
@property (nonatomic, assign)NSInteger width;

@end

