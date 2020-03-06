//
//  KeyFrameAnimationViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/3/6.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface KeyFrameAnimationViewController ()

@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, copy) CAKeyframeAnimation *animation;

@end

@implementation KeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = 50;
    CGRect rect = CGRectMake((SCREENWIDTH - width) / 2, SCREENHEIGHT / 2 - 100 - width / 2, width, width);
    self.greenView = [[UIView alloc] initWithFrame:rect];
    self.greenView.backgroundColor = [UIColor greenColor];
    self.greenView.layer.cornerRadius = width / 2;
    
    [self.view addSubview:self.greenView];
    [self configAnimation];
}

- (void)configAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREENWIDTH/2 - 100, SCREENHEIGHT/2 - 100, 200, 200)];
    animation.path = path.CGPath;
    animation.duration = 2.0f;
    animation.autoreverses = YES;
    self.animation = animation;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.greenView.layer addAnimation:_animation forKey:@"pathAnimation"];
}



@end
