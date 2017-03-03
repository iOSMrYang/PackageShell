//
//  Untils.m
//  Shell
//
//  Created by Jie.Y.Mac on 17/3/3.
//  Copyright © 2017年 Jie.Y.Mac. All rights reserved.
//
#define LunchImagePath @"/Users/jie.y.mac/Desktop/VtobankIosNew/VtoBankIosNew/Images.xcassets/启动图/r47iPhonePortraitiOS8_375x667pt.imageset/lunchimage.png";
//#define PlistPath @"/Users/jie.y.mac/Desktop/Info.plist"




#define BundleVersion @"1.2"
#define BundleShortVersion @"1.2.2"
#define BundleIdentifier @"com.yinfeng.vtobank"
#define BundleDisplayName @"大丰农商银行"
#import "Untils.h"

@implementation Untils
+ (void)configure
{

    if ([Untils changePlist]) {
//        char ch1[1000],ch2[1000];
//        printf("请输入启动图路径: \n");
//        scanf("%s",ch1);
//        printf("请输入启动图替换图路径: \n");
//        scanf("%s",ch2);
//        
//        printf("启动图路径:%s \n启动图替换图路径:%s \n",ch1,ch2);
//        NSString * path1 = [NSString stringWithFormat:@"%s", ch1];
//        NSString * path2 = [NSString stringWithFormat:@"%s", ch2];
//        NSFileManager *fm = [NSFileManager defaultManager];
//        NSString *filePath1 = [path1 stringByAppendingPathComponent:@"HAHA"];
//        NSString *filePath2 = [path2 stringByAppendingPathComponent:@"HAHA"];
//        if ([fm fileExistsAtPath:filePath1]) {
//            BOOL isSuc = [fm removeItemAtPath:filePath1 error:NULL];
//            if (isSuc) {
//                NSError *error;
//                BOOL isCopy = [fm copyItemAtPath:filePath2 toPath:filePath1 error:&error];
//                if (isCopy) {
//                    NSLog(@"移动成功");
//                }else
//                {
//                    NSLog(@"%@",error.description);
//                }
//                
//            }
//            
//        }else
//        {
//            NSError *error;
//            BOOL isCopy = [fm copyItemAtPath:filePath2 toPath:filePath1 error:&error];
//            if (isCopy) {
//                NSLog(@"移动成功");
//            }else
//            {
//                NSLog(@"%@",error.description);
//            }
//        }

    }
    
}

+ (BOOL)changePlist
{
    
    char ch1[1000];
    printf("请plist文件路径: \n");
    scanf("%s",ch1);
    
    printf("plist文件路径:%s \n",ch1);
    NSString * plistPath = [NSString stringWithFormat:@"%s", ch1];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    if (dic) {
        [dic setObject:BundleShortVersion forKey:@"CFBundleShortVersionString"];
        [dic setObject:BundleDisplayName forKey:@"CFBundleDisplayName"];
        [dic setObject:BundleDisplayName forKey:@"CFBundleName"];
        [dic setObject:BundleIdentifier forKey:@"CFBundleIdentifier"];
        [dic setObject:BundleVersion forKey:@"CFBundleVersion"];
    }else
    {
        NSLog(@"%s %d",__func__,__LINE__);
        return NO;
    }

    if ([fm createFileAtPath:plistPath contents:nil attributes:nil]) {
        BOOL isCreate = [dic writeToFile:plistPath atomically:YES];
        if (isCreate) {
            return YES;
        }else
        {
            NSLog(@"%s %d",__func__,__LINE__);
            return NO;
        }
        
        
    }else{
        return NO;
    }
    
}

@end
