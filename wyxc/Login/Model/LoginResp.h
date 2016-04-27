//
//  LoginResponse.h
//  cjxc
//
//  Created by kael on 8/6/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYXCBaseResp.h"

@interface LoginResp : WYXCBaseResp
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *userType;
@property(nonatomic, copy) NSString *avatarKey;
@property(nonatomic, copy) NSString *avatarBucket;
@property(nonatomic, copy) NSString *loginId;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *nickName;
@property(nonatomic, copy) NSString *sex;
@property(nonatomic, copy) NSString *accessToken;
@end
