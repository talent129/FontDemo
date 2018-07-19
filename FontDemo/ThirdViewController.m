//
//  ThirdViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdDetailViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor magentaColor];
    self.title = @"Third";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(pushToDetail)];
}

- (void)pushToDetail
{
    ThirdDetailViewController *vc = [[ThirdDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
