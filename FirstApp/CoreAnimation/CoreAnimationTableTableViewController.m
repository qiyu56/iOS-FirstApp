//
//  CoreAnimationTableTableViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/3/6.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "CoreAnimationTableTableViewController.h"
#import "TransitionAnimationViewController.h"
#import "KeyFrameAnimationViewController.h"
#import "BasicAnimationViewController.h"

@interface CoreAnimationTableTableViewController ()

@property (nonatomic, copy) NSArray<NSString *> *titles;

@end

@implementation CoreAnimationTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"reuse"];
    self.title = @"Core Animation";
    
    _titles = @[@"TransitionAnimation", @"KeyFrameAnimation", @"BasicAnimation"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            TransitionAnimationViewController *vc = [[TransitionAnimationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            [self.navigationController pushViewController:[[KeyFrameAnimationViewController alloc] init] animated:YES];
            break;
        }
        case 2: {
            [self.navigationController pushViewController:[[BasicAnimationViewController alloc] init] animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
