//
//  RegisterEntity+CoreDataProperties.h
//  wyxc
//
//  Created by Fighting on 16/4/14.
//  Copyright © 2016年 Fighting. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RegisterEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSString *userPassword;
@property (nullable, nonatomic, retain) NSString *userEmail;

@end

NS_ASSUME_NONNULL_END
