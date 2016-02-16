//
//  GetMIMEType.h
//  08-掌握-获得文件的MIMEType
//
//  Created by HEYANG on 16/2/16.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetMIMEType : NSObject
/** 通过请求的方式获取网络文件或者本地文件的MIMEType，本地网络的文件均可 */
+ (NSString*)getMIMETypeURLRequestAtFilePath:(NSString*)path;


/** 通过C语言的API请求的方式获取网络文件或者本地文件的MIMEType,只能获取本地文件哦，无法获取网络请求来的文件 */
+ (NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path;

@end
