//
//  YMLotteryViewController.m
//  YMLotteryV2.0
//
//  Created by 樊彦明 on 15/7/31.
//  Copyright (c) 2015年 Yeahming. All rights reserved.
//  主TabBar控制器

#import "YMLotteryViewController.h"
#import "YMLotteryHallTableViewController.h"
#import "YMArenaViewController.h"
#import "YMDiscoveryTableViewController.h"
#import "YMHistoryTableViewController.h"
#import "YMMyLotteryViewController.h"
#import "YMItem.h"
#import "YMWrapViewController.h"
#import "YMTabBar.h"
#import "YMBarButton.h"

@interface YMLotteryViewController ()<YMTabBarDelegate>
/** 模型数组 */
@property (nonatomic , strong) NSMutableArray *items;

@end

@implementation YMLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置子控制器
    [self setUpAllChildViewControllers];
    
    
    
}

#pragma mark - 替换系统tabBar
- (void)viewDidAppear:(BOOL)animated
{
    // 创建自定义tabbar
    YMTabBar *myBar = [[YMTabBar alloc] init];
    [self.tabBar addSubview:myBar];
    myBar.frame = self.tabBar.bounds;
    // 设置图片
    myBar.items = self.items;
    // 设置代理
    myBar.delegate = self;
}

#pragma mark - YMTabBarDelegate
- (void)barButtonClicked:(YMBarButton *)btn
{
    self.selectedIndex = btn.tag;
}

#pragma mark - 设置所有自控制器
- (void)setUpAllChildViewControllers
{
    // 购彩大厅
    YMLotteryHallTableViewController *lotteryHallVC = [[YMLotteryHallTableViewController alloc] init];
    [self setEachChildViewController:lotteryHallVC andImageName_normal:@"TabBar_LotteryHall_new" andImageName_selected:@"TabBar_LotteryHall_selected_new" andTitle:@"购彩大厅"];
    
    // 竞技场
    YMArenaViewController *arenaVC = [[YMArenaViewController alloc] init];
    [self setEachChildViewController:arenaVC andImageName_normal:@"TabBar_Arena_new" andImageName_selected:@"TabBar_Arena_selected_new" andTitle:@"竞技场"];
    
    // 发现
    YMDiscoveryTableViewController *discoveryVC = [[YMDiscoveryTableViewController alloc] init];
    [self setEachChildViewController:discoveryVC andImageName_normal:@"TabBar_Discovery_new" andImageName_selected:@"TabBar_Discovery_selected_new" andTitle:@"发现"];
    
    // 开奖信息
    YMHistoryTableViewController *historyVC = [[YMHistoryTableViewController alloc] init];
    [self setEachChildViewController:historyVC andImageName_normal:@"TabBar_History_new" andImageName_selected:@"TabBar_History_selected_new" andTitle:@"开奖信息"];
    
    // 我的彩票
    YMMyLotteryViewController *myLotteryVC = [[YMMyLotteryViewController alloc] init];
    [self setEachChildViewController:myLotteryVC andImageName_normal:@"TabBar_MyLottery_new" andImageName_selected:@"TabBar_MyLottery_selected_new" andTitle:@"我的彩票"];
    
}

- (void)setEachChildViewController:(UIViewController *)VC andImageName_normal:(NSString *)imageName_normal andImageName_selected:(NSString *)imageName_selected andTitle:(NSString *)title
{
    // 首先将相关数据存到模型中，便于后续访问
    YMItem *item = [[YMItem alloc] init];
    item.imageNormal = [UIImage imageNamed:imageName_normal];
    item.imageSelected = [UIImage imageNamed:imageName_selected];
    item.title = title;
    [self.items addObject:item];
    
    //包装后并添加子控制器
    if ([VC isKindOfClass:[YMArenaViewController class]]) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
        [self addChildViewController:nav];
    }
    else
    {
        
        YMWrapViewController *nav = [[YMWrapViewController alloc] initWithRootViewController:VC];
        
        // 设置导航控制其的标题
        VC.navigationItem.title = title;
        
        [self addChildViewController:nav];
    }
    
}

// 懒加载数组
- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
