//
//  HttpController.m
//  wyxc
//
//  Created by li on 16/4/25.
//  Copyright © 2016年 Fighting. All rights reserved.
//

#import "HttpController.h"

@interface HttpController ()

@end

@implementation HttpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * URLString = @"http://localhost:63342/htdocs/basic/form/myForm.php";
    NSURL * URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:URL];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"error: %@",[error localizedDescription]);
    }else{
        NSLog(@"response : %@",response);
        NSLog(@"backData : %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
