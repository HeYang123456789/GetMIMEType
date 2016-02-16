//
//  ViewController.m
//  获得文件的MIMEType工具类
//
//  Created by HEYANG on 16/2/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//

#import "ViewController.h"

#import "GetMIMEType.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这个方法只能获取本地文件的MIMEType
    NSString *fileMIMETypeWithCAPI = [GetMIMEType getMIMETypeWithCAPIAtFilePath:@"/Users/HeYang/Desktop/123.png"];
    NSLog(@"%@",fileMIMETypeWithCAPI);
    
    // 这个方法还可以请求网络文件
    NSString* fileMIMETypeWithURLRequest = [GetMIMEType getMIMETypeURLRequestAtFilePath:@"/Users/HeYang/Desktop/123.png"];
    NSLog(@"%@",fileMIMETypeWithURLRequest);
}

@end
