//
//  HttpService.m
//  ttxc
//
//  Created by kael on 6/22/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "HttpService.h"
//#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "GlobalData.h"

typedef NS_ENUM(NSInteger, HTTPMethod) {
    HTTPMethod_GET = 1,
    HTTPMethod_POST = 2
};

@implementation HttpService

+ (void)get:(NSString *)method
     params:(NSDictionary *)params
    success:(success)success
    failure:(failure)failure {
    
    [self runRequest:method
              params:params
             success:success
             failure:failure
          HTTPMethod:HTTPMethod_GET];
}

+ (void)post:(NSString *)method
      params:(NSDictionary *)params
     success:(success)success
     failure:(failure)failure {
    NSMutableDictionary *_parameters =
    [[NSMutableDictionary alloc] initWithDictionary:params];
    NSString *token =
    [[GlobalData sharedGlobalData] readAccessTokenFromUserDefault];
    if (token) {
        [_parameters setObject:token forKey:@"token"];
    }
    [self runRequest:method
              params:_parameters
             success:success
             failure:failure
          HTTPMethod:HTTPMethod_POST];
}

/**
 *  发送请求
 *  这是一个没有暴露的方法，只有自己才可以调用对象或类成员才可以调用
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param fail       失败回调
 *  @param HTTPMethod HTTP方法
 */
+ (void)runRequest:(NSString *)method
            params:(NSDictionary *)params
           success:(success)success
           failure:(failure)failure
        HTTPMethod:(HTTPMethod)HTTPMethod {
    //  AFHTTPRequestOperationManager *manager =
    //      [AFHTTPRequestOperationManager manager];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObject:@"text/html"];
    [[AFHTTPRequestSerializer serializer] requestWithMethod:method
                                                  URLString:@""
                                                 parameters:params
                                                      error:nil];
    if (HTTPMethod == HTTPMethod_GET) {
        //    [manager GET:method
        //        parameters:params
        //        success:^(NSURLSessionTask *task, id responseObject) {
        //          //        NSLog(@"JSON: %@", responseObject);
        //          success(task);
        //        }
        //        failure:^(NSURLSessionTask *operation, NSError *error) {
        //          NSLog(@"Error: %@", error);
        //          failure(error);
        //        }];
        
        [manager GET:method
          parameters:params
            progress:^(NSProgress *_Nonnull downloadProgress) {
            }
             success:^(NSURLSessionDataTask *_Nonnull task,
                       id _Nullable responseObject) {
                 success(task);
             }
             failure:^(NSURLSessionDataTask *_Nullable task,
                       NSError *_Nonnull error) {
                 NSLog(@"Error: %@", error);
                 
                 failure(error);
             }];
    } else if (HTTPMethod == HTTPMethod_POST) {
        //    [manager POST:method
        //        parameters:params
        //        success:^(NSURLSessionTask *task, id responseObject) {
        //          //        NSLog(@"JSON: %@", responseObject);
        //          success(responseObject);
        //        }
        //        failure:^(NSURLSessionTask *operation, NSError *error) {
        //          NSLog(@"Error: %@", error);
        //          failure(error);
        //        }];
        
        //不只是注册的时候会调用这个方法，每次请求都会调用这个方法。然后所以这个success的block不一定是注册的时候的block.
        
        [manager POST:method
           parameters:params
             progress:^(NSProgress *_Nonnull uploadProgress) {
             }
              success:^(NSURLSessionDataTask *_Nonnull task,
                        id _Nullable responseObject) {
                  //这个success不是最初那个success了
                  success(responseObject);
              }
              failure:^(NSURLSessionDataTask *_Nullable task,
                        NSError *_Nonnull error) {
                  NSLog(@"Error: %@", error);
                  
                  failure(error);
              }];
    }
}

+ (void)getByNSURLSession:(NSString *)method

                   params:(NSDictionary *)params
                  success:(success)success
                  failure:(failure)failure {
    [self runRequestByNSURLSession:method
                            params:params
                           success:success
                           failure:failure
                        HTTPMethod:HTTPMethod_GET];
}

+ (void)postByNSURLSession:(NSString *)method
                    params:(NSDictionary *)params
                   success:(success)success
                   failure:(failure)failure {
    
    [self runRequestByNSURLSession:method
                            params:params
                           success:success
                           failure:failure
                        HTTPMethod:HTTPMethod_POST];
}

/**
 *  发送请求(NSURLSession,requires iOS 7 or OS X 10.9)
 *
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param fail       失败回调
 *  @param HTTPMethod HTTP方法
 */
+ (void)runRequestByNSURLSession:(NSString *)method
                          params:(NSDictionary *)params
                         success:(success)success
                         failure:(failure)failure
                      HTTPMethod:(HTTPMethod)HTTPMethod {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (HTTPMethod_GET == HTTPMethod) {
        [manager POST:method
           parameters:params
              success:^(NSURLSessionDataTask *task, id responseObject) {
                  success(responseObject);
              }
              failure:^(NSURLSessionDataTask *task, NSError *error) {
                  failure(error);
              }];
    } else if (HTTPMethod_POST == HTTPMethod) {
        [manager POST:method
           parameters:params
              success:^(NSURLSessionDataTask *task, id responseObject) {
                  success(responseObject);
              }
              failure:^(NSURLSessionDataTask *task, NSError *error) {
                  failure(error);
              }];
    }
}
@end
