//
//  LoginService.h
//  cjxc
//
//  Created by kael on 8/5/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginService : NSObject
/**
 *  登录
 *
 *  @param userName 用户名
 *  @param password 密码
 */
+ (void)login:(NSString *)userName
     password:(NSString *)password
      success:(success)success
      failure:(failure)failure;
@end
