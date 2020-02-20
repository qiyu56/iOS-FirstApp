//
//  RootTableViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/2/19.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "RootTableViewController.h"
#import "EditingCellViewController.h"
#import "TextViewController.h"
#import "LocationAndMapViewController.h"

@interface RootTableViewController ()

@property (nonatomic, copy) NSArray *titles;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"rootTableViewCell"];
    
    self.titles = @[@"EditingTableViewCell", @"BottomTextBarView", @"LocationAndMap"];
    self.title = @"First App";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rootTableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}


# pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [self.navigationController pushViewController:[[EditingCellViewController alloc] init] animated:YES];
            break;
        }
        case 1: {
            [self.navigationController pushViewController:[[TextViewController alloc] init] animated:YES];
            break;
        }
        case 2: {
            [self.navigationController pushViewController:[[LocationAndMapViewController alloc] init] animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
