//
//  TextViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/2/19.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "TextViewController.h"
#import "TextBar.h"
@import Masonry;

#define BOTTOMVIEWHEIGHT 40

@interface TextViewController () <TextBarDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) TextBar *textBar;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width - 2 * 10, 50)];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:15];
    _label.layer.borderWidth = 0.5;
    _label.layer.borderColor = [UIColor grayColor].CGColor;
    _label.layer.cornerRadius = 19;
    _label.hidden = YES;
    [self.view addSubview:_label];
    
    _textBar = [[TextBar alloc] init];
    [self.view addSubview:_textBar];
    [_textBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.leading.trailing.mas_equalTo(self.view);
    }];
    _textBar.delegate = self;
    
    _bottomView = [[UIView alloc] init];
    [self.view addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(BOTTOMVIEWHEIGHT);
        make.top.mas_equalTo(self.textBar.mas_bottom);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)note {
    CGFloat keyboardHeight = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self.textBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-keyboardHeight);
    }];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)note {
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self.textBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-BOTTOMVIEWHEIGHT);
    }];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)showText:(nonnull NSString *)text {
    if (text.length > 0) {
        self.label.text = text;
        self.label.hidden = NO;
    }
}

@end
