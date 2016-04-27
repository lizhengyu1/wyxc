//
//  CacheUser.m
//  cjxc
//
//  Created by kael on 8/29/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "CacheUser.h"

@implementation CacheUser
- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super init]) {
    self.userId = [aDecoder decodeObjectForKey:@"userId"];
    self.userType = [aDecoder decodeObjectForKey:@"userType"];
    self.avatarKey = [aDecoder decodeObjectForKey:@"avatarKey"];
    self.avatarBucket = [aDecoder decodeObjectForKey:@"avatarBucket"];
    self.loginId = [aDecoder decodeObjectForKey:@"loginId"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.nickName = [aDecoder decodeObjectForKey:@"nickName"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
//    self.disturbSetting = [aDecoder decodeObjectForKey:@"disturbSetting"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:self.userId forKey:@"userId"];
  [aCoder encodeObject:self.userType forKey:@"userType"];
  [aCoder encodeObject:self.avatarKey forKey:@"avatarKey"];
  [aCoder encodeObject:self.avatarBucket forKey:@"avatarBucket"];
  [aCoder encodeObject:self.loginId forKey:@"loginId"];
  [aCoder encodeObject:self.name forKey:@"name"];
  [aCoder encodeObject:self.nickName forKey:@"nickName"];
  [aCoder encodeObject:self.sex forKey:@"sex"];
  [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
//  [aCoder encodeObject:self.disturbSetting forKey:@"disturbSetting"];
}

@end
