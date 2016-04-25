//
//  MainController.m
//  wyxc
//
//  Created by Fighting on 16/4/2.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import "MainController.h"
#import "AppDelegate.h"
@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIStoryboard *contactsStoryboard = [UIStoryboard storyboardWithName:@"Contacts" bundle:nil];
    UIStoryboard *discoveryStoryboard = [UIStoryboard storyboardWithName:@"Discovery" bundle:nil];
    UIStoryboard *meStoryboard = [UIStoryboard storyboardWithName:@"Me" bundle:nil];
    UIStoryboard *calendarStoryboard = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
    
    
    UIViewController *homeController = [homeStoryboard instantiateInitialViewController];
    UIViewController *contactsController = [contactsStoryboard instantiateInitialViewController];
    UIViewController *discoveryController = [discoveryStoryboard instantiateInitialViewController];
    UIViewController *meController = [meStoryboard instantiateInitialViewController];
    
    UIViewController *calendarController = [calendarStoryboard instantiateInitialViewController];
    
    
    homeController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"index_shouye_click" ] selectedImage:[UIImage imageNamed:@"index_shouye_clicked"]];
    contactsController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"学车记" image:[UIImage imageNamed:@"index_xuecheji_check"] selectedImage:[UIImage imageNamed:@"index_xuecheji_checked"]];
    discoveryController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"index_discover_click"] selectedImage:[UIImage imageNamed:@"index_discover_clicked"]];
    meController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"index_me_click"] selectedImage:[UIImage imageNamed:@"index_me_clicked"]];
    
    
    self.viewControllers = @[homeController,contactsController,discoveryController,meController];
    
    
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
