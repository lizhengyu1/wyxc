//
//  RegisterController.h
//  wyxc
//
//  Created by Fighting on 16/4/18.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UIView *manClickView;
@property (weak, nonatomic) IBOutlet UIButton *manBtn;


@property (weak, nonatomic) IBOutlet UIView *womanClickView;
@property (weak, nonatomic) IBOutlet UIButton *womanBtn;

@property (weak, nonatomic) IBOutlet UILabel *manLabel;
@property (weak, nonatomic) IBOutlet UILabel *womanLabel;



@end
