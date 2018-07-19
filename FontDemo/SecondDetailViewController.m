//
//  SecondDetailViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "SecondDetailViewController.h"
#import "Define.h"
#import <Masonry/Masonry.h>

@interface SecondDetailViewController ()

@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) UILabel *testDetailLabel;

@end

@implementation SecondDetailViewController

- (UILabel *)testLabel
{
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.textColor = [UIColor whiteColor];
        _testLabel.text = @"放假啊肯定是发的时佛物二手啦发送到发而";
        _testLabel.numberOfLines = 0;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat fontValue = [defaults floatForKey:kFontSizeValue];
        _testLabel.font = Font(fontSize_16 + fontValue);
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
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat fontValue = [defaults floatForKey:kFontSizeValue];
        
        _testDetailLabel.font = Font(fontSize_12 + fontValue);
    }
    return _testDetailLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"SecondDetail";
    
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.testLabel];
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(@100);
    }];
    
    [self.view addSubview:self.testDetailLabel];
    [self.testDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(self.testLabel.mas_bottom).mas_offset(15);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
