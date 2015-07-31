//
//  YMWrapViewController.m
//  YMLotteryV2.0
//
//  Created by 樊彦明 on 15/7/31.
//  Copyright (c) 2015年 Yeahming. All rights reserved.
//

#import "YMWrapViewController.h"

@interface YMWrapViewController ()

@end

@implementation YMWrapViewController
#pragma mark - 统一设置导航控制器相关属性
+ (void)initialize
{
    UINavigationBar *naviBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 导航条背景颜色
    [naviBar setBackgroundImage:[UIImage imageWithStretchableFromImageName:@"toolbar_background"] forBarMetrics:(UIBarMetricsDefault)];
    // 标题字体颜色
    [naviBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
