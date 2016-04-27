//
//  CacheUser.h
//  cjxc
//
//  Created by kael on 8/29/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheUser : NSObject <NSCoding>
@property(nonatomic, copy) NSString *userId;       //用户id
@property(nonatomic, copy) NSString *userType;     //用户类型
@property(nonatomic, copy) NSString *avatarKey;    //用户头像Key
@property(nonatomic, copy) NSString *avatarBucket; //用户头像Bucket
@property(nonatomic, copy) NSString *loginId;     //用户登录ID(手机号码)
@property(nonatomic, copy) NSString *name;        //用户名称
@property(nonatomic, copy) NSString *nickName;    //用户昵称
@property(nonatomic, copy) NSString *sex;         //用户性别
@property(nonatomic, copy) NSString *accessToken; //用户TOKEN
@end
