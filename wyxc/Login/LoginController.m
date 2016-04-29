//
//  LoginController.m
//  wyxc
//
//  Created by Fighting on 16/4/14.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import "LoginController.h"
#import "AppDelegate.h"
#import "LoginService.h"
#import "Utils.h"


@interface LoginController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UITextField *userNameField;

@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户登录";
    [self.navigationController.navigationBar setBarTintColor:RGB(40, 170, 250)];
    ;
//-----！设置标题字体颜色-----------
    
    UIColor *color = [UIColor whiteColor];
    NSDictionary *dd = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    [self.navigationController.navigationBar setTintColor:color];
    self.navigationController.navigationBar.titleTextAttributes = dd;
    //-----设置标题字体颜色 ！-----------
    
    NSString *rightTitle = @"随便看看";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:rightTitle style:UIBarButtonItemStyleDone target:self action:@selector(RightAction:)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    UIColor *bgColor = RGB(250, 250, 250);
    UIColor *white = [UIColor whiteColor];
    self.view.backgroundColor = white;
    
//-------设置文本域无边框---------
    self.userNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userNameField.borderStyle = UITextBorderStyleNone;
//    self.userNameField.keyboardType = UIKeyboardTypeNumberPad;
    self.userNameField.font = FONT18;
    self.userNameField.tintColor = RGB(200, 200, 200);
    self.userNameField.textColor = TOOLBAR_TEXT_COLOR;
    self.userNameField.backgroundColor = [UIColor whiteColor];
    
    self.userPasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userPasswordField.secureTextEntry = YES;
    self.userPasswordField.borderStyle = UITextBorderStyleNone;
    self.userPasswordField.font = FONT18;
    self.userPasswordField.textColor = TOOLBAR_TEXT_COLOR;
    [self.navigationController setNavigationBarHidden:NO];
    self.userPasswordField.tintColor = RGB(200, 200, 200);
    self.userPasswordField.backgroundColor = [UIColor whiteColor];
    //-------------设置文本域无边框---------

}

-(IBAction)RightAction:(id)sender {
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = [homeStoryboard instantiateViewControllerWithIdentifier:@"MainController"];
}

//登录Action
- (IBAction)loginButon:(UIButton *)sender {
    
    NSString *userName = self.userNameField.text;
    NSString *password = self.userPasswordField.text;
    
    [LoginService login:userName
               password:password
                success:^(id data) {
                    //NSLog(@"%@",data);
                    [Utils showMessage:self.view message:data];
                }
                failure:^(id data) {
                    NSLog(@"%@",data);
                }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
