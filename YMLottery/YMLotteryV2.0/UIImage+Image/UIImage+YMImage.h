//
//  UIImage+YMImage.h
//  YM彩票
//
//  Created by Yeahming on 15/7/19.
//  Copyright © 2015年 Yeahming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YMImage)
+ (UIImage *)imageWithAlwaysOriginalRenderingModelFromImageName:(NSString *)ImageName;
+ (UIImage *)imageWithStretchableFromImageName:(NSString *)imageName;
@end
