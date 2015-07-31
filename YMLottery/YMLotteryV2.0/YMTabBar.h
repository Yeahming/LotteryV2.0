//
//  YMTabBar.h
//  YMLotteryV2.0
//
//  Created by 樊彦明 on 15/7/31.
//  Copyright (c) 2015年 Yeahming. All rights reserved.
//
@class YMBarButton;
@protocol YMTabBarDelegate <NSObject>
@optional
- (void)barButtonClicked:(YMBarButton *)btn;

@end
#import <UIKit/UIKit.h>
@interface YMTabBar : UIView

/** 模型数组 */
@property (nonatomic , strong) NSMutableArray *items;

/** 代理属性 */
@property (nonatomic, weak) id<YMTabBarDelegate> delegate;
@end
