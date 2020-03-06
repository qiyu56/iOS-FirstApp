//
//  TransitionAnimationViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/3/5.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "TransitionAnimationViewController.h"

@interface TransitionAnimationViewController ()

@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, copy) CATransition *transition;

@end

@implementation TransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat width = 200;
    CGRect rect = CGRectMake((screenWidth - 200) / 2, self.view.center.y - (width / 2), width, width);
    self.yellowView = [[UIView alloc] initWithFrame:rect];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    self.blueView = [[UIView alloc] initWithFrame:rect];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.yellowView];
    
    self.yellowView.hidden = NO;
    self.blueView.hidden = YES;
    [self configAnimation];
}

- (void)configAnimation {
    CATransition* transition = [CATransition animation];
    transition.startProgress = 0;
    transition.endProgress = 1.0;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0;
    
    self.transition = transition;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Add the transition animation to both layers
    [self.yellowView.layer addAnimation:self.transition forKey:@"transition"];
    [self.blueView.layer addAnimation:self.transition forKey:@"transition"];
    
    // Finally, change the visibility of the layers.
    self.yellowView.hidden = !self.yellowView.hidden;
    self.blueView.hidden = !self.blueView.hidden;
}



@end
