//
//  RegisterService.h
//  cjxc
//
//  Created by kael on 8/14/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterService : NSObject

/**
 *  获取短信验证码
 *
 *  @param mobileNo   手机号码
 *  @param verifyType 验证码类型
 *  @param success
 *  @param failure
 */
+ (void)getVerifyCode:(NSString *)mobileNo
           verifyType:(NSString *)verifyType
              success:(success)success
              failure:(failure)failure;

/**
 *  用户注册
 *
 *  @param parameters 参数
 *  @param success
 *  @param failure
 */
+ (void)userRegister:(NSDictionary *)parameters
             success:(success)success
             failure:(failure)failure;

/**
 *  忘记密码
 *
 *  @param parameters 参数
 *  @param success
 *  @param failure
 */
+ (void)forgotPassword:(NSDictionary *)parameters
               success:(success)success
               failure:(failure)failure;

/**
 *  检查手机号码是否已注册
 *
 *  @param mobileNo 手机号码
 *  @param userType 用户类型
 *  @param success
 *  @param failure
 */
+ (void)detectMobileNo:(NSString *)mobileNo
              userType:(NSString *)userType
               success:(success)success
               failure:(failure)failure;

@end
