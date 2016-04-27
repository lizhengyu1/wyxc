//
//  GlobalData.h
//  cjxc
//
//  Created by Alex on 15/8/2.
//  Copyright (c) 2015年 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheUser.h"

@interface GlobalData : NSObject

@property(nonatomic, strong) NSString *accessToken;
@property(nonatomic, strong) NSString *account;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong) NSDictionary *dicts;  //动态字典
@property(nonatomic, strong) CacheUser *user;      //动态字典
@property(nonatomic, strong) NSDictionary *region; //区域字典
@property(nonatomic, strong)
    NSDictionary *regionNodeName; //区域中间结点名称字典
@property(nonatomic, strong) NSDictionary *hotCityDictionary; //热门城市字典
@property(nonatomic, copy) NSString *disturbSetting; //教练打扰设置
@property(nonatomic, copy) NSString *deviceToken;    //设备Token

+ (GlobalData *)sharedGlobalData;
/**
 *  将GlobaData持久话到NSUserDefaults
 */
- (void)saveDataToUserDefault;

- (NSString *)readAccountFromUserDefault;
/**
 *  读取密码
 *
 *  @return <#return value description#>
 */
- (NSString *)readPasswordFromUserDefault;
/**
 *  读取用户Token
 *
 *  @return <#return value description#>
 */
- (NSString *)readAccessTokenFromUserDefault;
/**
 *  读取动态字典
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)readDictsFromUserDefault;

/**
 *  读取区域信息
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)readRegionFromUserDefault;
- (NSDictionary *)readRegionNodeNameFromUserDefault;
- (NSDictionary *)readHotCityDictionaryFromUserDefault;

/**
 *  读取缓存用户
 *
 *  @return <#return value description#>
 */
- (CacheUser *)readUserFromUserDefault;

/**
 *  保存动态字典
 */
- (void)saveDicts;

/**
 *  保存行政区域
 */
- (void)saveRegion;

/**
 *  保存教练打扰设置
 */
- (void)saveDisturbSetting;

/**
 *  读取教练防打扰设置
 */
- (NSString *)readDisturbSettingFromUserDefaults;

/**
 *  保存缓存用户信息
 */
- (void)saveUser;

/**
 *  根据Key提取本地缓存数据
 *
 *  @param key <#key description#>
 */
- (id)readFromUserDefault:(NSString *)key;

/**
 *  根据字典类型获取所有字典项
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
-(NSDictionary *)readDictsFromUserDefaultByType:(NSString *)key;


- (void)saveDataToUserDefault:(NSString*)key value:(id)vlaue;

@end
