//
//  WYXCBaseResp.h
//  wyxc
//
//  Created by li on 16/4/27.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"


@interface WYXCBaseResp : MTLModel <MTLJSONSerializing>

@property(nonatomic) NSInteger code; // API接口请求结果状态编码

@property(nonatomic, copy) NSString *message; // API接口请求状态信息

@end
