//
//  Utils.h
//  ttxc
//
//  Created by kael on 6/12/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Common.h"
#import "MBProgressHUD.h"

typedef void (^ButtonEvent)();
typedef NS_ENUM(NSInteger, CheckInputType) {
  UserNameType = 1,
  EmailType = 2,
  PasswordType = 3,
  MoBileNoType = 4
};
@interface Utils : NSObject
/**
 *  获取ossservice实例
 *  @param type 1:oss存储服务,2:oss图片服务
 *
 *  @return <#return value description#>
 */
+ (id)sharedOssService:(OSSBizType)type;
/**
 *  根据范围生成随机数
 *
 *  @param from <#from description#>
 *  @param to   <#to description#>
 *
 *  @return <#return value description#>
 */
+ (int)getRandomNumber:(NSInteger)from to:(NSInteger)to;

/**
 *  根据ps字号转换成ios字号
 *
 *  @param pixel ps字号
 *
 *  @return ios字号
 */
+ (CGFloat)convertPsPx2Pt:(CGFloat)pixel;

+ (int)currentDevice;
/**
 *  获取所有的系统字体
 */
+ (void)printAllFonts;
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber;
#pragma 正则匹配用户密码6 - 18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password;
#pragma 正则匹配用户姓名, 20位的中文或英文
+ (BOOL)checkUserName:(NSString *)userName;
#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard:(NSString *)idCard;
#pragma 正则匹员工号, 12位的数字
+ (BOOL)checkEmployeeNumber:(NSString *)number;
#pragma 正则匹配URL
+ (BOOL)checkURL:(NSString *)url;
#pragma 正则匹配整数
+ (BOOL)checkInteger:(NSString *)url;
/**
  *  表单校验
  *
  *  @param textType <#textType description#>
  *  @param text     <#text description#>
  *
  *  @return <#return value description#>
  */
+ (BOOL)checkInput:(CheckInputType)textType input:(NSString *)text;

#pragma mark - OSS

/**
 *  从OSS加载图片(图片处理服务)
 *
 *  @param bucketId <#bucketId description#>
 *  @param key      <#key description#>
 *  @param success  <#success description#>
 *  @param failure  <#failure description#>
 */
//+ (void)loadThumbImageData:(NSString *)bucketId
//                       key:(NSString *)key
//                   success:(success)success
//                   failure:(failure)failure;

/**
 *  从OSS加载图片(图片存储服务)
 *
 *  @param bucketId <#bucketId description#>
 *  @param key      <#key description#>
 *  @param success  <#success description#>
 *  @param failure  <#failure description#>
 */
+ (void)loadImageDataAsync:(NSString *)bucketId
                       key:(NSString *)key
                   success:(success)success
                   failure:(failure)failure;

/**
 *  oss图片上传(同步)
 *
 *  @param data     需要上传的二进制数据
 *  @param bucketId OSS BucketId(如果nil,则为默认Bucket)
 *  @param key      UUID文件名(不包含后缀)
 *  @param filePath 文件夹路径(如:@"文件夹1级/文件2级/文件夹3级")
 *  @param fileType 文件类型(文件以文件类型作为后缀名)
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)uploadImageSync:(nonnull NSData *)data
               bucketId:(nullable NSString *)bucketId
                    key:(nonnull NSString *)key
               filePath:(nonnull NSString *)filePath
               fileType:(nonnull NSString *)fileType
                success:(nonnull success)success
                failure:(nonnull failure)failure
         uploadProgress:(nullable uploadProgress)uploadProgress;

/**
 *  oss图片上传(异步)
 *
 *  @param data     需要上传的二进制数据
 *  @param bucketId OSS BucketId(如果nil,则为默认Bucket)
 *  @param key      UUID文件名(不包含后缀)
 *  @param filePath 文件夹路径(如:@"文件夹1级/文件2级/文件夹3级")
 *  @param fileType 文件类型(文件以文件类型作为后缀名)
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)uploadImageAsync:(NSData *)data
                bucketId:(NSString *)bucketId
                     key:(NSString *)key
                filePath:(NSString *)filePath
                fileType:(NSString *)fileType
                 success:(success)success
                 failure:(failure)failure
          uploadProgress:(nullable uploadProgress)uploadProgress;

/**
 *  从OSS加载图片(图片存储服务)
 *
 *  @param bucketId <#bucketId description#>
 *  @param key      <#key description#>
 *  @param success  <#success description#>
 *  @param failure  <#failure description#>
 */
+ (NSData *)loadImageDataSync:(NSString *)bucketId key:(NSString *)key;

/**
 *  从OSS获取图片URL(图片存储服务)
 *
 *  @param bucketId <#bucketId description#>
 *  @param key      <#key description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getImageUrl:(NSString *)bucketId key:(NSString *)key;

//+ (NSString *)getImageUrl1:(NSString *)bucketId key:(NSString *)key;

/**
 *  日期字符串转日期对象
 *
 *  @param dateString <#dateString description#>
 *
 *  @return <#return value description#>
 */
+ (NSDate *)string2Date:(NSString *)dateString
           formatterStr:(NSString *)formatterStr;

/**
 *  日期对象转日期字符串
 *
 *  @param dateString <#dateString description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)stringFromDate:(NSDate *)date
                formatterStr:(NSString *)formatterStr;
/**
 *  缩短日期字符串
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)dateStringShorter:(NSString *)dateStr
                   formatterStr:(NSString *)formatterStr;

+ (NSString *)dateStringShorter:(NSString *)dateStr
                    inFormatter:(NSString *)inFormatter
                   outFormatter:(NSString *)outFormatter;

#pragma mark - ViewUtils
//简单的弹出框
+ (void)alertMessage:(NSString *)message title:(NSString *)title;
//弹出选择的alert框
+ (void)alertMessage:(NSString *)title
             message:(NSString *)message
              lTitle:(NSString *)lTitle
              rTitle:(NSString *)rTtitle
             lAction:(ButtonEvent)lAction
             rAction:(ButtonEvent)rAction;

/**
 *  弹出提示视图
 *
 *  @param view    <#view description#>
 *  @param message <#message description#>
 */
+ (void)showMessage:(UIView *)view message:(NSString *)message;

/**
 *  弹出提示框(带延时)
 *
 *  @param view       <#view description#>
 *  @param message    <#message description#>
 *  @param afterDelay <#afterDelay description#>
 */
+ (void)showMessage:(UIView *)view
            message:(NSString *)message
         afterDelay:(NSTimeInterval)afterDelay;
/**
 *  弹出提示视图
 *
 *  @param view    <#view description#>
 *  @param message <#message description#>
 */
+ (void)showMessageMultiLine:(UIView *)view message:(NSString *)message;

/**
 *  弹出提示框(带延时)
 *
 *  @param view       <#view description#>
 *  @param message    <#message description#>
 *  @param afterDelay <#afterDelay description#>
 */
+ (void)showMessageMultiLine:(UIView *)view
                     message:(NSString *)message
                  afterDelay:(NSTimeInterval)afterDelay;

#pragma mark Date Utils
/**
 *  转换农历
 *
 *  @param solarDate <#solarDate description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)lunarForSolar:(NSDate *)solarDate;

/**
 *  根据当前时间的半小时(如当前时间为6:00,则返回6:30)
 *
 *  @return <#return value description#>
 */
+ (NSDate *)getCurrentHourHalf;

/**
 *  将date转换成本地时间
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
+ (NSDate *)getLocalDate:(NSDate *)date;

/**
 *  判断字符串是否为空或者空白
 *
 *  @return <#return value description#>
 */
+ (BOOL)isBlank:(NSString *)source;

/**
 *  根据字典类型Code以及字典项Code获取字典项描述
 *
 *  @param dictTypeCode <#dictTypeCode description#>
 *  @param dictCode     <#dictCode description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDictDescFromDicts:(nonnull NSString *)dictTypeCode
                      dictItemCode:(nonnull NSString *)dictCode;

/**
 *  根据字典类型获取所有字典项
 *
 *  @param dictTypeCode 字典类型代码
 *
 *  @return
 */
+ (NSArray *)getDictsByType:(NSString *)dictTypeCode;

/**
 *  获取热门城市
 *
 *  @return Dictionary(key == city.code, value == city.name)
 */
+(NSDictionary *)getHotCity;


+(void)listAllObjects;

/**
 *  将字典或者数组转化为JSON串
 *
 *  @param theData
 *
 *  @return
 */
+ (NSData *)toJSONData:(id)theData;


+(NSString *)firstLetterOfString:(NSString *) source;

+ (MBProgressHUD *)showMessageWithHud:(UIView *)view message:(NSString *)message;

+ (MBProgressHUD *)showMessageWithHud:(UIView *)view mode:(MBProgressHUDMode)mode message:(NSString *)message;
/**
 *  获取图片的类型
 *
 *  @param data 二进制数据
 *
 *  @return 图片类型
 */
+ (NSString *)typeForImageData:(NSData *)data ;

/**
 *  获取头像背景颜色
 *
 *  @return 
 */
+(UIColor*)getAvatarColor;
/**
 *  JSON字符串转JSON
 *
 *  @param jsonString <#jsonString description#>
 *
 *  @return <#return value description#>
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSString*)dictionaryToJson:(NSDictionary *)dict;

/**
 *  判断当前用户是否已登录
 *
 *  @return 
 */
+(BOOL)isLogin;
/**
 *  当前用户是否是教练
 *
 *  @return
 */
+(BOOL)isCoach;

/**
 *  当前用户是否是学员
 *
 *  @return
 */
+(BOOL)isStudent;
@end
