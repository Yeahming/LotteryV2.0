//
//  YMTabBar.m
//  YMLotteryV2.0
//
//  Created by 樊彦明 on 15/7/31.
//  Copyright (c) 2015年 Yeahming. All rights reserved.
//

static const int YMTotalCounts = 5;
static const CGFloat YMBarButtonH = 49;

#import "YMTabBar.h"
#import "YMItem.h"
#import "YMBarButton.h"

@interface YMTabBar()
/** 上一个被点击的按钮 */
@property (nonatomic , strong) YMBarButton *lastClickedBtn;

@end
@implementation YMTabBar

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 添加子控件
        for (int i = 0; i < YMTotalCounts; i ++) {
            // 创建子控件
            YMBarButton *barButton = [YMBarButton buttonWithType:(UIButtonTypeCustom)];
            [self addSubview:barButton];
            
            if (i == 0) {
                barButton.selected = YES;
                _lastClickedBtn = barButton;
            }
            
            // 绑定tag
            barButton.tag = i;
            
            // 监听按钮点击
            [barButton addTarget:self action:@selector(barButtonClicked:) forControlEvents:(UIControlEventTouchDown)];
        }
    }
    return self;
}

#pragma mark - 按钮监听方法
- (void)barButtonClicked:(YMBarButton *)btn
{
    // 取消上一个按钮的状态
    if (btn.tag != _lastClickedBtn.tag) {
        _lastClickedBtn.selected = NO;
    }
    
    // 改变按钮状态
    btn.selected = YES;
    
    // 通知代理切换界面
    if ([self.delegate respondsToSelector:@selector(barButtonClicked:)]) {
        [self.delegate barButtonClicked:btn];
    }
    // 记录本次被点击的按钮
    self.lastClickedBtn = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnW = YMScreenW/YMTotalCounts;
    CGFloat btnH = YMBarButtonH;
    for (int i = 0; i < YMTotalCounts; i++) {
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        // 布局子控件
        YMBarButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

// 重写items setter
-(void)setItems:(NSMutableArray *)items
{
    _items = items;
    
    for (int i = 0; i < YMTotalCounts; i++) {
        // 去除模型
        YMItem *item = items[i];
        // 去除按钮
        YMBarButton *btn = self.subviews[i];
        
        // 设置按钮属性
        [btn setBackgroundImage:item.imageNormal forState:(UIControlStateNormal)];
        [btn setBackgroundImage:item.imageSelected forState:(UIControlStateSelected)];
        
    }
}


@end
