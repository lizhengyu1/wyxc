//
//  HttpService.h
//  ttxc
//  http服务类
//  Created by kael on 6/22/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

// typedef void (^success)(id data);
// typedef void (^failure)(id data);

@interface HttpService : NSObject
/**
 *  get方式请求
 *
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param failure       失败回调
 */
+ (void)get:(NSString *)method
     params:(NSDictionary *)params
    success:(success)success
    failure:(failure)failure;

/**
 *  post方式请求
 *
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param failure       失败回调
 */
+ (void)post:(NSString *)method
      params:(NSDictionary *)params
     success:(success)success
     failure:(failure)failure;

/**
 * get方式请求(NSURLSession,requires iOS 7 or OS X 10.9)
 *
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param failure       失败回调
 */
+ (void)getByNSURLSession:(NSString *)method
                   params:(NSDictionary *)params
                  success:(success)success
                  failure:(failure)failure;

/**
 *  post方式请求(NSURLSession,requires iOS 7 or OS X 10.9)
 *
 *  @param method     请求URL
 *  @param params     请求参数
 *  @param success    成功回调
 *  @param failure       失败回调
 */
+ (void)postByNSURLSession:(NSString *)method
                    params:(NSDictionary *)params
                   success:(success)success
                   failure:(failure)failure;
/**
 *  get方式(同步)
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *
 *  @return return value description
 */
+ (id)getSync:(NSString *)method params:(NSDictionary *)success;

/**
 *  post方式(同步)
 *
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *
 *  @return return value description
 */
+ (id)postSync:(NSString *)method params:(NSDictionary *)success;
@end
