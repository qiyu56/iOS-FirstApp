//
//  BasicAnimationViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/3/6.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

//  https://www.youtube.com/watch?v=UoaPPPxS-qI

#import "BasicAnimationViewController.h"

#define mNavigationBarHeight 88

@interface BasicAnimationViewController ()

- (IBAction)beginAnimation:(id)sender;

@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)beginAnimation:(id)sender {
    UIView *viewToAnimate = [[UIView alloc] initWithFrame:CGRectMake(75, mNavigationBarHeight + 75, 75, 75)];
    viewToAnimate.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:viewToAnimate];
    
    CGPoint startPoint = CGPointMake(75, mNavigationBarHeight + 75);
    CGPoint endPoint = CGPointMake(150, mNavigationBarHeight + 225);
    CGFloat duration = 6.0f;
    
    CABasicAnimation *positionAnimation = [self constructPositionAnimation:startPoint endPoint:endPoint duration:duration];
    [viewToAnimate.layer addAnimation:positionAnimation forKey:@"position"];
//    viewToAnimate.layer.position = endPoint;
    
    CABasicAnimation *scaleAnimation = [self constructScaleAnimation:1.0 endingScale:0.4 animationDuration:2.0];
    [viewToAnimate.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    CABasicAnimation *rotationAnimation = [self constructRotationAnimation:1.3];
    [viewToAnimate.layer addAnimation:rotationAnimation forKey:@"rotation"];
    
    CABasicAnimation *opacityAnimation = [self constructOpacityAnimation:1.0 endingOpacity:0.15 animationDuration:1.5];
    [viewToAnimate.layer addAnimation:opacityAnimation forKey:@"opacity"];
//    viewToAnimate.layer.opacity = 0.0;
}

- (CABasicAnimation *)constructOpacityAnimation:(CGFloat)startingOpacity endingOpacity:(CGFloat)endingOpacoty animationDuration:(CGFloat)animationDuration {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:startingOpacity];
    opacityAnimation.toValue = [NSNumber numberWithFloat:endingOpacoty];
    opacityAnimation.duration = animationDuration;
    opacityAnimation.autoreverses = YES;
    opacityAnimation.repeatCount = NSIntegerMax;
    return opacityAnimation;
}

- (CABasicAnimation *)constructRotationAnimation:(CGFloat)animationDuration {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.fromValue = 0;
    rotationAnimation.toValue = [NSNumber numberWithDouble:M_PI * 2]; //360度
    rotationAnimation.duration = animationDuration;
    rotationAnimation.repeatCount = NSIntegerMax;
    return rotationAnimation;
}

- (CABasicAnimation *)constructScaleAnimation:(CGFloat)startingScale endingScale:(CGFloat)endingScale animationDuration:(CGFloat)animationDuration {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:startingScale];
    scaleAnimation.toValue = [NSNumber numberWithFloat:endingScale];
    scaleAnimation.duration = animationDuration;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = NSIntegerMax;
    return scaleAnimation;
}

- (CABasicAnimation *)constructPositionAnimation:(CGPoint)startPoint endPoint:(CGPoint)endPoint duration:(CGFloat)animationDuration {
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    positionAnimation.duration = animationDuration;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    positionAnimation.autoreverses = YES;
    positionAnimation.repeatCount = NSIntegerMax;
    return positionAnimation;
}

@end
