//
//  ViewController.m
//  test_ DZNEmptyDataSet
//
//  Created by felix on 2016/11/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)onTestClicked:(id)sender {
    CustomViewController *cvc = [CustomViewController new];
    [self.navigationController pushViewController:cvc animated:true];
}

@end
