//
//  LoginService.m
//  cjxc
//
//  Created by kael on 8/5/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "LoginService.h"
//#import "DES3Util.h"
#import "HttpService.h"
#import "WYXCBaseResp.h"
#import "GlobalData.h"
//#import "LoginResp.h"
//#import "PushNotificationService.h"

@implementation LoginService
+ (void)login:(NSString *)userName
     password:(NSString *)password
      success:(success)success
      failure:(failure)failure {
    NSString *p =
    [NSString stringWithFormat:@"%@|%@|%@", userName, password, @""];
//    NSString *para = [DES3Util encrypt:p];
    NSDictionary *dict = @{ @"loginId" : userName,  @"password": password};
    [HttpService post:@"http://localhost:63342/WYXC_SERVER/API/Login/login.php"//SERVER_PATH(URL_LOGIN)
               params:dict
              success:^(id data) {
                  NSError *error;
                  WYXCBaseResp *resp = [MTLJSONAdapter modelOfClass:[WYXCBaseResp class]
                                                 fromJSONDictionary:data
                                                              error:&error];
                  if (1 == resp.code) {
//                     LoginResp *loginResp = [MTLJSONAdapter modelOfClass:[LoginResp class]
//                                                       fromJSONDictionary:data
//                                                                    error:&error];
//                      [LoginService syncUserDefaults:loginResp];
//                      
//                      //登录完成后更新Token
//                      [PushNotificationService updateDeviceToken];
                      NSLog(@"登录成功");
                      //NSLog(@"%@",resp.message);
                      success(data);
                  } else {
                      NSLog(@"登录失败");
                      failure(resp.message);
                      
                  }
              }
              failure:^(id data) {
                  NSLog(@"%@shibaireason",data);
                  NSLog(@"登录失败");
                  failure(LOGIN_ERROR_MSG);
              }];
}

//+ (void)syncUserDefaults:(LoginResp *)resp {
//    if (!resp) {
//        return;
//    }
//    //保存用户TOKEN
//    GlobalData *globalData = [GlobalData sharedGlobalData];
//    globalData.accessToken = resp.accessToken;
//    [globalData saveDataToUserDefault];
//    CacheUser *user = globalData.user;
//    if (!user) {
//        user = [[CacheUser alloc] init];
//    }
//    user.userId = resp.userId;
//    user.userType = resp.userType;
//    user.avatarKey = resp.avatarKey;
//    user.avatarBucket = resp.avatarBucket;
//    user.loginId = resp.loginId;
//    user.name = resp.name;
//    user.nickName = resp.nickName;
//    user.sex = resp.sex;
//    
//    user.accessToken = resp.accessToken;
//    NSLog(@"当前登录用户Token:%@", resp.accessToken);
//    //保存用户缓存
//    globalData.user = user;
//    [globalData saveUser];
//    NSLog(@"");
//}
@end
