//
//  CustomViewController.m
//  test_ DZNEmptyDataSet
//
//  Created by felix on 2016/11/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "CustomViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface CustomViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
    
    self.dataSource = [NSMutableArray new];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark -- empty set image datasource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"icon_test"];
}

#pragma mark -- empty set image delegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    NSLog(@"empty data set ");
    [self.dataSource addObject:@"hello q"];
    [self.tableView reloadData];
}


@end
