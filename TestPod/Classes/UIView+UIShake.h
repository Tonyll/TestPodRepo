//
//  UIView+UIShake.h
//  Sample
//
//  Created by Tony L on 14-3-21.
//  Copyright (c) 2014年 Fancy Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, ShakeDirection) {
//    ShakeDirectionHorizontal = 0,
//    ShakeDirectionVertical
//};

typedef enum{
    ShakeDirectionHorizontal = 0,
    ShakeDirectionVertical
} ShakeDirection;

@interface UIView (UIShake)


-(void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)direction;


@end
