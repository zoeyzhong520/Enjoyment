//
//  NSModel.m
//  Enjoyment
//
//  Created by zzj on 16/12/9.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import "NSModel.h"

@implementation NSModel

@end

@implementation NSModelData

@end

@implementation NSItems

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"NSId":@"id"}];
}

@end

@implementation NSAdditionalField

@end

@implementation NSItemImage

@end