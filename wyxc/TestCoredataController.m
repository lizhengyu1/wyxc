//
//  TestCoredataController.m
//  wyxc
//
//  Created by Fighting on 16/4/14.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import "TestCoredataController.h"
#import "AppDelegate.h"
#import "RegisterEntity+CoreDataProperties.h"
#import "RegisterEntity.h"

@interface TestCoredataController ()

@property(nonatomic,strong) AppDelegate *delegate;

@property (weak, nonatomic) IBOutlet UITextField *addtext;
- (IBAction)add:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *deletetext;
- (IBAction)delete:(id)sender;

- (IBAction)query:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *converttext;
- (IBAction)convert:(id)sender;

@end

@implementation TestCoredataController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    // Do any additional setup after loading the view.
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

//1.添加
- (IBAction)add:(id)sender {
    NSString *addName = self.addtext.text;
    RegisterEntity *RE = [NSEntityDescription insertNewObjectForEntityForName:@"RegisterEntity" inManagedObjectContext:_delegate.managedObjectContext];
    RE.userName = addName;
    NSError *error = nil;
    if ([_delegate.managedObjectContext save:&error]) {
        NSLog(@"添加用户名成功");
    }else {
        NSLog(@"添加失败");
    }
}
- (IBAction)delete:(id)sender {
}

- (IBAction)query:(id)sender {
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"RegisterEntity"];
    NSArray *array = [_delegate.managedObjectContext executeFetchRequest:request error:nil];
    for (RegisterEntity *RE in array) {
        NSLog(@"name-->%@",RE.userName);
    }
}
- (IBAction)convert:(id)sender {
}
@end
