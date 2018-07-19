//
//  FirstViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "FirstViewController.h"
#import "Define.h"
#import "FirstDetailViewController.h"
#import <Masonry/Masonry.h>
#import "FontInstance.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIButton *pushDetailBtn;
@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) UILabel *testDetailLabel;

@end

@implementation FirstViewController

#pragma mark -
- (UIButton *)pushDetailBtn
{
    if (!_pushDetailBtn) {
        _pushDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushDetailBtn.backgroundColor = [UIColor purpleColor];
        [_pushDetailBtn setTitle:@"pushDetail" forState:UIControlStateNormal];
        [_pushDetailBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _pushDetailBtn.titleLabel.font = Font(fontSize_16);
        [_pushDetailBtn addTarget:self action:@selector(pushDetailAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushDetailBtn;
}

- (UILabel *)testLabel
{
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.textColor = [UIColor whiteColor];
        _testLabel.text = @"放假啊肯定是发的时佛物二手啦发送到发而";
        _testLabel.numberOfLines = 0;
        _testLabel.font = Font(fontSize_16);
    }
    return _testLabel;
}

- (UILabel *)testDetailLabel
{
    if (!_testDetailLabel) {
        _testDetailLabel = [[UILabel alloc] init];
        _testDetailLabel.textColor = [UIColor blueColor];
        _testDetailLabel.text = @"abcdefghijklmnopqrstuvwxyz";
        _testDetailLabel.numberOfLines = 0;
        _testDetailLabel.font = Font(fontSize_12);
    }
    return _testDetailLabel;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat fontValue = [defaults floatForKey:kFontSizeValue];
    
    //push按钮标题字体大小不变化 则不设置
    self.testLabel.font = Font(fontSize_16 + fontValue);
    self.testDetailLabel.font = Font(fontSize_12 + fontValue);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"First";
    
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.pushDetailBtn];
    [self.pushDetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
    [self.view addSubview:self.testLabel];
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(self.pushDetailBtn.mas_bottom).mas_offset(15);
    }];
    
    [self.view addSubview:self.testDetailLabel];
    [self.testDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(self.testLabel.mas_bottom).mas_offset(15);
    }];
}

- (void)pushDetailAction
{
    FirstDetailViewController *vc = [[FirstDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
