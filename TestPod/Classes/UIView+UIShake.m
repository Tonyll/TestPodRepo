//
//  UIView+UIShake.m
//  Sample
//
//  Created by Tony L on 14-3-21.
//  Copyright (c) 2014年 Fancy Pixel. All rights reserved.
//

#import "UIView+UIShake.h"

@implementation UIView (UIShake)


/**
 *  <#Description#>
 *
 *  @param times          shake times
 *  @param delta          shake delta
 *  @param interval       shake interval
 *  @param shakeDirection whether herizontal or vertical
 */
- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval shakeDirection:shakeDirection];
}

/**
 *  <#Description#>
 *
 *  @param times          shake times
 *  @param direction      the default direction, value is 1,means move to the positive direction at first
 *  @param current        the times that view has shaken
 *  @param delta          the same meaning
 *  @param interval       the same meaning
 *  @param shakeDirection the same meaning
 */
- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection
{
    [UIView animateWithDuration:interval
                     animations:^{
                         //decide the transformation Horizontal or Vertical
                         self.transform = (shakeDirection == ShakeDirectionHorizontal ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction));
                     }
                     completion:^(BOOL finished) {
                         if (current >= times) {
                             self.transform = CGAffineTransformIdentity;
                             return;
                         }
                         [self _shake:(times - 1)
                            direction:direction * -1
                         currentTimes:current + 1
                            withDelta:delta
                             andSpeed:interval
                       shakeDirection:shakeDirection];
                     }];
}

@end
