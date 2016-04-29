//
//  detectMobileNoResp.m
//  cjxc
//
//  Created by li on 16/3/3.
//  Copyright © 2016年 gzlz. All rights reserved.
//

#import "DetectMobileNoResp.h"

@implementation DetectMobileNoResp

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{ @"items" : @"items" };
}

+ (NSValueTransformer *)itemsJSONTransformer {
  return [MTLJSONAdapter
      dictionaryTransformerWithModelClass:[DetectMobileNoItem class]];
}

@end

@implementation DetectMobileNoItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{ @"result" : @"result", @"ID" : @"id" };
}

@end
