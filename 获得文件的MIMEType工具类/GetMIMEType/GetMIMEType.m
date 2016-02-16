//
//  GetMIMEType.m
//  08-掌握-获得文件的MIMEType
//
//  Created by HEYANG on 16/2/16.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "GetMIMEType.h"

#import <MobileCoreServices/MobileCoreServices.h>

@implementation GetMIMEType

#pragma mark - 类方法
+ (NSString*)getMIMETypeURLRequestAtFilePath:(NSString*)path{
    return [[[GetMIMEType alloc] init] getMIMETypeURLRequestAtPath:path];
}

+ (NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path{
    return [[[GetMIMEType alloc] init] getMIMETypeWithCAPIAtFilePath:path];
}
#pragma mark - 对象方法
//向该文件发送请求,根据请求头拿到该文件的MIMEType
-(NSString *)getMIMETypeURLRequestAtPath:(NSString*)path
{
    //1.确定请求路径
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //3.发送请求
    NSHTTPURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSString *mimeType = response.MIMEType;
    return mimeType;
}

//调用C语言的API来获得文件的MIMEType ，只能获取本地文件哦，无法获取网络请求来的文件
-(NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path
{
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType)
    ;
}

@end
