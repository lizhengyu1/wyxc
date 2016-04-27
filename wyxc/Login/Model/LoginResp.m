//
//  LoginResponse.m
//  cjxc
//
//  Created by kael on 8/6/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "LoginResp.h"

@implementation LoginResp
//+ (NSValueTransformer *)heightJSONTransformer {
//    return [MTLJSONAdapter integerTransformer]"
//}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{
    @"userId" : @"userInfo.id",
    @"userType" : @"userInfo.userType",
    @"avatarKey" : @"userInfo.avatar.key",
    @"avatarBucket" : @"userInfo.avatar.bucket",
    @"loginId" : @"userInfo.loginId",
    @"name" : @"userInfo.name",
    @"nickName" : @"userInfo.nickname",
    @"sex" : @"userInfo.sex",
    @"accessToken" : @"userInfo.token"
  };
}
//{
//    "code": 1,
//    "message": "成功",
//    "userInfo": {
//        "id": "3",
//        "userType": "0",
//        "avatar": {
//            "key": "user/6f8c4b1d-de7e-43a4-9084-4b48bcbe87e5.jpg",
//            "width": 43.0,
//            "heigh": 43.0,
//            "bucket": "supercar"
//        },
//        "loginId": "13500002222",
//        "name": "陈奕迅",
//        "nickname": "医生",
//        "sex": "男",
//        "accessToken": "5ece0bbef5c9b8fb8ed3adba348abed2"
//    }
//}
@end
