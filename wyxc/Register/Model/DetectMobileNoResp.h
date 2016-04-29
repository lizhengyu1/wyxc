//
//  detectMobileNoResp.h
//  cjxc
//
//  Created by li on 16/3/3.
//  Copyright © 2016年 gzlz. All rights reserved.
//

#import "WYXCBaseResp.h"
#import <Foundation/Foundation.h>

@class DetectMobileNoItem;

@interface DetectMobileNoResp : WYXCBaseResp

@property(nonatomic, strong) DetectMobileNoItem *items;

@end

@interface DetectMobileNoItem : MTLModel <MTLJSONSerializing>

@property(nonatomic) NSInteger result;
@property(nonatomic, retain) NSString *ID;

@end