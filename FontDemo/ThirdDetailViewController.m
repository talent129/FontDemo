//
//  ThirdDetailViewController.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "ThirdDetailViewController.h"
#import "Define.h"
#import <Masonry/Masonry.h>
#import "FontInstance.h"

@interface ThirdDetailViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation ThirdDetailViewController

- (UILabel *)testLabel
{
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.textColor = [UIColor purpleColor];
        _testLabel.numberOfLines = 0;
        _testLabel.font = Font(16);
        _testLabel.text = @"预览字体大小";
    }
    return _testLabel;
}

- (UISlider *)slider
{
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.minimumValue = -8;
        _slider.maximumValue = 8;
        _slider.minimumTrackTintColor = [UIColor greenColor];
        _slider.maximumTrackTintColor = [UIColor redColor];
        _slider.thumbTintColor = [UIColor lightGrayColor];
        [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat fontValue = [defaults floatForKey:kFontSizeValue];
        _slider.value = fontValue;
        
    }
    return _slider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ThirdDetail-修改字体";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI
{
    [self.view addSubview:self.testLabel];
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@30);
        make.trailing.equalTo(@-30);
        make.top.equalTo(@100);
    }];
    
    [self.view addSubview:self.slider];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@30);
        make.top.equalTo(@200);
        make.trailing.equalTo(@-30);
        make.height.equalTo(@20);
    }];
}

- (void)sliderAction
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.slider.value forKey:kFontSizeValue];
    [defaults synchronize];
    
    FontInstance *instance = [FontInstance sharedInstance];
    instance.fontValueBOOL = YES;
    
    self.testLabel.font = Font(fontSize_16 + self.slider.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
