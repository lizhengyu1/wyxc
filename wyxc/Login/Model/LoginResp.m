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
    @"userId" : @"item.userInfo.id",
    @"userType" : @"item.userInfo.userType",
    @"avatarKey" : @"item.userInfo.avatar.key",
    @"avatarBucket" : @"item.userInfo.avatar.bucket",
    @"loginId" : @"item.userInfo.loginId",
    @"name" : @"item.userInfo.name",
    @"nickName" : @"item.userInfo.nickname",
    @"sex" : @"item.userInfo.sex",
    @"accessToken" : @"item.accessToken"
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
