//
//  TextBar.m
//  FirstApp
//
//  Created by qiyu on 2020/2/19.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "TextBar.h"
@import Masonry;

@interface TextBar ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation TextBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.button = [UIButton new];
        [self.button setTitle:@"Show" forState:UIControlStateNormal];
        [self.button sizeToFit];
        [self.button addTarget:self action:@selector(showMessage) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:self.button];
        
        self.textView = [[UITextView alloc] init];
        self.textView.layer.cornerRadius = 19;
        self.textView.layer.borderWidth = 0.5;
        self.textView.layer.borderColor = [UIColor grayColor].CGColor;
        self.textView.font = [UIFont systemFontOfSize:15];
        self.textView.returnKeyType = UIReturnKeySend;
        self.textView.enablesReturnKeyAutomatically = YES;
        self.textView.showsVerticalScrollIndicator = NO;
        self.textView.textContainerInset = UIEdgeInsetsMake(12, 10, 12, 0);
        [self addSubview:self.textView];
        
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.mas_equalTo(6);
        make.height.mas_equalTo(self.frame.size.height - 2 * 6);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.mas_trailing).offset(-10);
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(45);
        make.centerY.mas_equalTo(self.textView.mas_centerY);
        make.leading.mas_equalTo(self.textView.mas_trailing).offset(18);
    }];
}

- (void)showMessage {
    [self.delegate showText:self.textView.text];
    self.textView.text = nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (CGRectContainsPoint(self.bounds, point)) {
        return [super hitTest:point withEvent:event];
    }
    [self.textView resignFirstResponder];  //隐藏键盘
    return nil;
}

@end
