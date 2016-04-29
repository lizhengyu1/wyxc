//
//  RegisterController.m
//  wyxc
//
//  Created by Fighting on 16/4/18.
//  Copyright © 2016年 Fighting. All rights reserved.
//
//是否还是爱你啊a
#import "RegisterController.h"
#import "Utils.h"
#import "RegisterService.h"

@interface RegisterController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
//教练选项按钮
@property (strong, nonatomic) IBOutlet UISegmentedControl *userTypeSegment;

@property (weak, nonatomic) IBOutlet UITextField *smsField;

@property (weak, nonatomic) IBOutlet UITextField *codeField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *passwordAgainField;

@property(strong, nonatomic) IBOutlet UILabel *registerProtocolLabel;

@property (weak, nonatomic) IBOutlet UIButton *verifyCodeBtn;


@property(nonatomic, copy) NSString *mobileNo;       //电话号码
@property(nonatomic, copy) NSString *verifyCode;     //验证码
@property(nonatomic, copy) NSString *password;       //密码
@property(nonatomic, copy) NSString *verifyPassword; //重复密码
@property(nonatomic, copy) NSString *sex;            //性别
@property(nonatomic, copy) NSString *name;           //名称
//- (IBAction)getVerifyCode:(id)sender;
@property(nonatomic, strong) NSTimer *verifyCodeTimer;
//@property(nonatomic, copy) NSString *nickName;  //昵称
@property(nonatomic, assign) NSInteger seconds; //发送验证码定时器记数
@property(nonatomic, assign)
BOOL isAllowSendVerifyCode; //是否已可以重新发验证码
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, copy) NSString *userType; //注册身份


@end

static NSString *const kProtocolTitleFirst = @"注册即视为同意";
static NSString *const kProtocolTitleSecondForCoach =
@"《" @"教" @"练服务协议》";
static NSString *const kProtocolTitleSecondForStudent =
@"《" @"用" @"户服务条款》";

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameField.borderStyle = UITextBorderStyleNone;
    self.smsField.borderStyle = UITextBorderStyleNone;
    self.codeField.borderStyle = UITextBorderStyleNone;
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordAgainField.borderStyle = UITextBorderStyleNone;
    
    //获取验证码按钮设置
    self.verifyCodeBtn.backgroundColor = RED_BUTTON_BACKGROUND_COLOR;
    self.verifyCodeBtn.titleLabel.font = FONT11;
    self.verifyCodeBtn.tintColor = [UIColor whiteColor];
    [self.verifyCodeBtn.layer setCornerRadius:(CGFloat)5];
    
    //注册按钮设置
    self.registerBtn.backgroundColor = BUTTON_BACKGROUND_COLOR;
    self.registerBtn.tintColor = [UIColor whiteColor];
    self.registerBtn.backgroundColor = BUTTON_BACKGROUND_COLOR;
    [self.registerBtn.layer setCornerRadius:(CGFloat)5];
    self.registerBtn.titleLabel.font = FONT18;
    
    self.manLabel.font = FONT15;
    self.womanLabel.font = FONT15;
    self.manLabel.textColor = RGB(67, 67, 67);
    self.womanLabel.textColor = RGB(67, 67, 67);
    
    self.manBtn.selected = YES;
    self.sex = @"男";
    UITapGestureRecognizer *manTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(onClickManView)];
    [self.manClickView addGestureRecognizer:manTap];
    UITapGestureRecognizer *womanTap = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(onClickWomanView)];
    [self.womanClickView addGestureRecognizer:womanTap];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"用户注册";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //设置segmented的属性
    //  self.userType = USER_TYPE_COACH; //默认注册教练
    _userTypeSegment.selectedSegmentIndex = -1;
    _userTypeSegment.tintColor = BUTTON_BACKGROUND_COLOR;
    _userTypeSegment.layer.cornerRadius = 5.0f;
    _userTypeSegment.clipsToBounds = YES;
    
    //键盘监听事件
    [self.smsField addTarget:self
                         action:@selector(textFieldDidChange:)
               forControlEvents:UIControlEventEditingChanged];
    self.smsField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSIndexPath *)tableView:(UITableView *)tv
  willSelectRowAtIndexPath:(NSIndexPath *)path {
    return path;
}


- (void)onClickManView {
    
    self.manBtn.selected = YES;
    self.womanBtn.selected = NO;
}

- (void)onClickWomanView {
    
    self.manBtn.selected = NO;
    self.womanBtn.selected = YES;
    
}

-(IBAction)sexBtn:(UIButton *)sender {
    if ([sender isEqual:self.manBtn]) {
        self.manBtn.selected = YES;
        self.womanBtn.selected = NO;
        self.sex = @"男";
    }else {
        self.manBtn.selected = NO;
        self.womanBtn.selected = YES;
        self.sex = @"女";
    }
}


- (IBAction)userTypeSegmented:(UISegmentedControl *)sender {
    NSMutableAttributedString *first = [[NSMutableAttributedString alloc]
                                        initWithString:kProtocolTitleFirst
                                        attributes:@{
                                                     NSForegroundColorAttributeName : FIELD_PLACEHOLDER_COLOR
                                                     }];
    NSMutableAttributedString *second;
    if (sender.selectedSegmentIndex == 0) {
        self.userType = USER_TYPE_COACH;
        second = [[NSMutableAttributedString alloc]
                  initWithString:kProtocolTitleSecondForCoach
                  attributes:@{NSForegroundColorAttributeName : NAV_BAR_COLOR}];
    } else {
        self.userType = USER_TYPE_STUDENT;
        second = [[NSMutableAttributedString alloc]
                  initWithString:kProtocolTitleSecondForStudent
                  attributes:@{NSForegroundColorAttributeName : NAV_BAR_COLOR}];
    }
    [first appendAttributedString:second];
    self.registerProtocolLabel.attributedText = first;
}


- (IBAction)registerAction:(UIButton *)sender {
    
    [self loadFormValue];
    // 验证表单
    NSString *message = [self checkForm];
    //获取表单数据
    if (![Utils isBlank:message]) {
        //    [self showMessage:message];
        self.registerBtn.enabled = YES;
        [Utils showMessage:self.view message:message];
        return;
    }
    NSString *userTypeMessage;
    if ([USER_TYPE_COACH isEqualToString:_userType]) {
        userTypeMessage = @"教练";
    } else if ([USER_TYPE_STUDENT isEqualToString:_userType]) {
        userTypeMessage = @"学员";
    }
    userTypeMessage =
    [NSString stringWithFormat:@"是否注册为%@", userTypeMessage];
    //确认注册身份
    [Utils alertMessage:@"提示"
                message:userTypeMessage
                 lTitle:@"确定"
                 rTitle:@"取消"
                lAction:^{
                    MBProgressHUD *hud =
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.labelFont = FONT12;
                    self.registerBtn.enabled = NO;
                    //提交注册
                    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                    if (self.mobileNo)
                        [parameters setObject:self.mobileNo forKey:@"loginId"];
                    if (self.password)
                        [parameters setObject:self.password forKey:@"password"];
                    if (self.name)
                        [parameters setObject:self.name forKey:@"name"];
                    if (self.sex)
                        [parameters setObject:self.sex forKey:@"sex"];
                    if (self.verifyCode)
                        [parameters setObject:self.verifyCode forKey:@"code"];
                    //暂不本地保存
                    //    [parameters setObject:[BizGlobalData
                    //    sharedGlobalData].userType
                    //                   forKey:@"userType"];
                    if (self.userType) {
                        [parameters setObject:self.userType forKey:@"userType"];
                    }
                    hud.labelText = @"正在注册新用户";
                    [RegisterService userRegister:parameters
                                          success:^(id data) {
                                              [hud hide:YES];
                                              self.registerBtn.enabled = YES;
                                              [Utils alertMessage:@"用户注册成功" title:@"确定"];
                              //                [self.navigationController popViewControllerAnimated:YES];
                                          }
                                          failure:^(id data) {
                                              //        [self showMessage:data];
                                              //        [Utils showMessage:self.view message:data];
                                              self.registerBtn.enabled = YES;
                                              hud.labelText = data;
                                              [hud hide:YES afterDelay:1];
                                          }];
                }
                rAction:^{
                }];
}


- (void)loadFormValue {
    //手机号码
    self.mobileNo = self.smsField.text;
    //验证码
    self.verifyCode = self.codeField.text;
    //密码
    self.password = self.passwordField.text;
    //重复密码
    self.verifyPassword = self.passwordAgainField.text;
    //姓名
    self.name = self.nameField.text;
    //昵称
    //  self.nickName = self.nickNameField.text;
}


- (NSString *)checkForm {
    NSString *message;
    if ([Utils isBlank:_userType]) {
        message = @"请选择注册身份";
        return message;
    }
    if (!self.name || [@"" isEqualToString:self.name]) {
        message = @"请输入姓名";
        return message;
    }
    //校验是否为空
    if (!self.mobileNo || [@"" isEqualToString:self.mobileNo]) {
        message = @"请输入手机号码";
        return message;
    } else {
        if (![Utils checkTelNumber:self.mobileNo]) {
            message = @"请输入正确的手机号码";
            return message;
        }
    }
    if (!self.verifyCode || [@"" isEqualToString:self.verifyCode]) {
        message = @"请输入验证码";
        return message;
    }
    if (!self.password || [@"" isEqualToString:self.password]) {
        message = @"请输入密码";
        return message;
    } else {
        if (![Utils checkPassword:self.password]) {
            if (6 > self.password.length) {
                message = @"至少需要6位密码长度";
                return message;
            }
            message = @"密码只能为数字和字母组合";
            return message;
        }
    }
    if (!self.verifyPassword || [@"" isEqualToString:self.verifyPassword]) {
        message = @"请输入重复密码";
        return message;
    }
    //校验密码是否一致
    if (![self.password isEqualToString:self.verifyPassword]) {
        message = @"两次密码输入不一致";
        return message;
    }
    return nil;
}



#pragma mark - 监听电话号码是否已注册
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.text.length >= 11) {
        [RegisterService detectMobileNo:textField.text
                               userType:self.userType //不去判断了。只要是注册过的号码。统一成功回调
                                success:^(id data) {
                                    
                                    [Utils showMessage:[[UIApplication sharedApplication].windows
                                                        objectAtIndex:1]
                                               message:@"手机号已注册，请找回密码"];
                                    //覆盖在键盘上面
                                }
                                failure:^(id data) {
                                    
                                    [Utils showMessage:self.view message:data];
                                }];
    }
}
//这个是代理方法，通过检测string来判断输入的是不是返回键
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    
    if (textField.text.length >= 11 && string.length > 0) {
        return NO;
        
    } else {
        return YES;
    }
}



#pragma mark - Table view data source



/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
