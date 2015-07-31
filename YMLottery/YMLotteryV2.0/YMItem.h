//
//  YMItem.h
//  YMLotteryV2.0
//
//  Created by 樊彦明 on 15/7/31.
//  Copyright (c) 2015年 Yeahming. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface YMItem : NSObject

/** Normal图片 */
@property (nonatomic ,strong) UIImage *imageNormal;
/** Highlight图片 */
@property (nonatomic , strong) UIImage *imageSelected;
/** 标题 */
@property (nonatomic , copy) NSString *title;

@end
