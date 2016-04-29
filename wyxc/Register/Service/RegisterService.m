//
//  RegisterService.m
//  cjxc
//
//  Created by kael on 8/14/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "RegisterService.h"
#import "HttpService.h"
#import "WYXCBaseResp.h"
#import "DetectMobileNoResp.h"

@implementation RegisterService

- (void)getVerifyCode:(success)success failure:(failure)failure {
}

+ (void)getVerifyCode:(NSString *)mobileNo
           verifyType:(NSString *)verifyType
              success:(success)success
              failure:(failure)failure {
    NSMutableDictionary *parameters =
    [[NSMutableDictionary alloc] initWithDictionary:@{
                                                      @"loginName" : mobileNo,
                                                      @"verifyType" : verifyType
                                                      }];
    [HttpService post:SERVER_PATH(URL_GET_VERIFY_CODE)
               params:parameters
              success:^(id data) {
                  NSError *error;
                  WYXCBaseResp *resp = [MTLJSONAdapter modelOfClass:[WYXCBaseResp class]
                                                 fromJSONDictionary:data
                                                              error:&error];
                  if (STATUS_CODE_SUCCESS == resp.code) {
                      success(data);
                  } else {
                      //连接成功，请求失败
                      failure(resp.message);
                  }
              }
              failure:^(id data) {
                  failure(GET_VERIFY_CODE_ERROR_MSG);
              }];
}


#pragma mark - 监听手机号码是否已注册
+ (void)detectMobileNo:(NSString *)mobileNo
              userType:(NSString *)userType
               success:(success)success
               failure:(failure)failure {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    if (mobileNo) {
        [parameters setObject:mobileNo forKey:@"loginName"];
    }
    if (userType) {
        [parameters setObject:userType forKeyedSubscript:@"userType"];
    }
    [HttpService post:@"http://localhost:63342/WYXC_SERVER/API/Verify/isSignUp.php"
               params:parameters
              success:^(id data) {
                  NSError *error;
                  WYXCBaseResp *resp = [MTLJSONAdapter modelOfClass:[WYXCBaseResp class]
                                                 fromJSONDictionary:data
                                                              error:&error];
                  if (WEI_ZHUCE == resp.code) {
//                      DetectMobileNoResp *detectMobileNoResp =
//                      [MTLJSONAdapter modelOfClass:[DetectMobileNoResp class]
//                                fromJSONDictionary:data
//                                             error:&error];
//                      if (detectMobileNoResp.items.result == 1) {
                        success(resp.message);
//                      }
                  } else {
                      //没有去判断userType的类型。统一注册过的就让他们去找回密码
                      //          success(data);
                      failure(resp.message);
                  }
              }
              failure:^(id data) {
                  failure(data);
              }];
}

+ (void)userRegister:(NSDictionary *)parameters
             success:(success)success
             failure:(failure)failure {
    
    [HttpService post:SERVER_PATH(URL_REGISTER)
               params:parameters
              success:^(id data) {
                  NSError *error;
                  WYXCBaseResp *resp = [MTLJSONAdapter modelOfClass:[WYXCBaseResp class]
                                                 fromJSONDictionary:data
                                                              error:&error];
                  
                  NSLog(@"%@",resp.message);
                  if (STATUS_CODE_SUCCESS == resp.code) {
                      success(resp.message);
                  } else {
                      failure(resp.message);
                  }
              }
              failure:^(id data) {
                  NSLog(@"%@",data);
                  failure(REGISTER_ERROR_MSG);
              }];
}

+ (void)forgotPassword:(NSDictionary *)parameters
               success:(success)success
               failure:(failure)failure {
    [HttpService post:SERVER_PATH(URL_FORGOT_PASSWORD)
               params:parameters
              success:^(id data) {
                  NSError *error;
                  WYXCBaseResp *resp = [MTLJSONAdapter modelOfClass:[WYXCBaseResp class]
                                                 fromJSONDictionary:data
                                                              error:&error];
                  if (STATUS_CODE_SUCCESS == resp.code) {
                      success(nil);
                  } else {
                      failure(resp.message);
                  }
              }
              failure:^(id data) {
                  failure(FORGOT_PASSWORD_ERROR_MSG);
              }];
}

@end
