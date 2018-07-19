//
//  SecondViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondDetailViewController.h"
#import <Masonry/Masonry.h>
#import "Define.h"
#import "TestModel.h"
#import "TestTableView.h"
#import "FontInstance.h"

@interface SecondViewController ()

@property (nonatomic, strong) TestTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SecondViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    FontInstance *instance = [FontInstance sharedInstance];
    if (instance.fontValueBOOL) {
        
        //若更改了字体大小 移除原先视图
        if (_tableView) {
            [_tableView removeFromSuperview];
            _tableView = nil;
        }
        
        //新建视图
        [self createUI];
        
        //MVC 移除了View 但M仍在 新建view后使用数据刷新view
        self.tableView.dataArray = self.dataArray;
        [self.tableView reloadData];
        
        instance.fontValueBOOL = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"Second";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(pushToDetail)];
    
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

- (void)pushToDetail
{
    SecondDetailViewController *vc = [[SecondDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
