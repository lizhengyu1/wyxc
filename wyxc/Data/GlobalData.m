//
//  GlobalData.m
//  cjxc
//
//  Created by Alex on 15/8/2.
//  Copyright (c) 2015年 gzlz. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

//@synthesize accessToken, account, password;

+ (GlobalData *)sharedGlobalData {
  static GlobalData *globalData = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    globalData = [[GlobalData alloc] init];
  });
  return globalData;
}

- (void)saveDataToUserDefault {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.account forKey:UD_ACCOUNT_KEY];
  [userDefaults setObject:self.password forKey:UD_PASSWORD_KEY];
  [userDefaults setObject:self.accessToken forKey:UD_ACCESS_TOKEN_KEY];
  [userDefaults setObject:self.dicts forKey:UD_DICTS_KEY];
  //  [userDefaults setObject:self.region forKey:UD_REGION_KEY];
  //  [userDefaults setObject:self.regionNodeName
  //  forKey:UD_REGION_NODE_NAME_KEY];
}

- (NSString *)readAccountFromUserDefault {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSString *a = [userDefaults objectForKey:UD_ACCOUNT_KEY];
  return a;
}

- (NSString *)readPasswordFromUserDefault {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSString *p = [userDefaults objectForKey:UD_PASSWORD_KEY];
  return p;
}

- (NSString *)readAccessTokenFromUserDefault {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [userDefaults objectForKey:UD_ACCESS_TOKEN_KEY];
  return token;
}

- (NSDictionary *)readDictsFromUserDefault {
  return [self readFromUserDefault:UD_DICTS_KEY];
}

- (NSDictionary *)readRegionFromUserDefault {
  return [self readFromUserDefault:UD_REGION_KEY];
}

- (NSDictionary *)readRegionNodeNameFromUserDefault {
  return [self readFromUserDefault:UD_REGION_NODE_NAME_KEY];
}

- (NSDictionary *)readHotCityDictionaryFromUserDefault {
  return [self readFromUserDefault:UD_HOT_CITY_KEY];
}

- (CacheUser *)readUserFromUserDefault {
  NSData *data = [self readFromUserDefault:UD_USER_KEY];
  CacheUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
  return user;
}

- (id)readFromUserDefault:(NSString *)key {
  if (!key) {
    return nil;
  }
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  id obj = [userDefaults objectForKey:key];
  return obj;
}

- (void)saveDicts {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.dicts forKey:UD_DICTS_KEY];
}

- (void)saveRegion {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.region forKey:UD_REGION_KEY];
  [userDefaults setObject:self.regionNodeName forKey:UD_REGION_NODE_NAME_KEY];
  [userDefaults setObject:self.hotCityDictionary forKey:UD_HOT_CITY_KEY];
  [userDefaults synchronize];
}

- (void)saveUser {
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.user];
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:data forKey:UD_USER_KEY];
}

- (void)saveDisturbSetting {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.disturbSetting forKey:UD_DISTURB_SETTING_KEY];
  [userDefaults synchronize];
}

- (NSString *)readDisturbSettingFromUserDefaults {
  return [self readFromUserDefault:UD_DISTURB_SETTING_KEY];
}

- (NSDictionary *)readDictsFromUserDefaultByType:(NSString *)key {
  NSDictionary *typeDict =
      [[GlobalData sharedGlobalData] readDictsFromUserDefault];
  return [typeDict objectForKey:key];
}

- (void)saveDataToUserDefault:(NSString *)key value:(id)value {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:value forKey:key];
  [userDefaults synchronize];
}

@end
