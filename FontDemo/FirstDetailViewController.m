//
//  FirstDetailViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "FirstDetailViewController.h"
#import <Masonry/Masonry.h>
#import "Define.h"
#import "TestModel.h"
#import "TestTableView.h"

@interface FirstDetailViewController ()

@property (nonatomic, strong) TestTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation FirstDetailViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (TestTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[TestTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FirstDetail";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    [self loadData];
}

- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"List.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        TestModel *model = [[TestModel alloc] init];
        model.name = dic[@"name"];
        model.detail = dic[@"detail"];
        model.descrip = dic[@"descrip"];
        [mArr addObject:model];
    }
    
    self.dataArray = mArr;
    self.tableView.dataArray = self.dataArray;
    [self.tableView reloadData];
}

- (void)createUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.and.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
