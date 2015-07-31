//
//  UIImage+YMImage.m
//  YM彩票
//
//  Created by Yeahming on 15/7/19.
//  Copyright © 2015年 Yeahming. All rights reserved.
//

#import "UIImage+YMImage.h"

@implementation UIImage (YMImage)
+ (UIImage *)imageWithAlwaysOriginalRenderingModelFromImageName:(NSString *)ImageName{
    UIImage *originalImage = [UIImage imageNamed:ImageName];
    return [originalImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}


+ (UIImage *)imageWithStretchableFromImageName:(NSString *)imageName
{
    UIImage *originalImage = [UIImage imageNamed:imageName];
    return [originalImage stretchableImageWithLeftCapWidth:originalImage.size.width*0.5 topCapHeight:originalImage.size.height*0.5];
}
@end
