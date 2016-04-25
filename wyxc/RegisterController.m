//
//  RegisterController.m
//  wyxc
//
//  Created by Fighting on 16/4/18.
//  Copyright © 2016年 Fighting. All rights reserved.
//
//是否还是爱你啊a
#import "RegisterController.h"

@interface RegisterController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *smsField;

@property (weak, nonatomic) IBOutlet UITextField *codeField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *passwordAgainField;


@property (weak, nonatomic) IBOutlet UIButton *verifyCodeBtn;

@end

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
    }else {
        self.manBtn.selected = NO;
        self.womanBtn.selected = YES;
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
