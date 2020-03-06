//
//  HaveLabelViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/2/25.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "HaveLabelViewController.h"
@import Masonry;

@interface HaveLabelViewController ()

@end

@implementation HaveLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 100)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
//    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(200, 24, 52, 52)];
//    whiteView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 24, 52, 52)];
    label.font = [UIFont systemFontOfSize:12];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor whiteColor];
//    label.contentMode = UIViewContentModeTop;
    
    [view addSubview:label];
    
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(whiteView.mas_centerY);
//        make.top.equalTo(whiteView.mas_top).offset(9);
//        make.bottom.equalTo(whiteView.mas_bottom).offset(-9);
//        make.leading.trailing.equalTo(whiteView);
//    }];
    
//    [view addSubview:whiteView];
    
    label.text = @"你好我知道你晚上好哈西斯三从四德次";
//    label.text = @"你好";
//    [label sizeToFit];
}



@end
