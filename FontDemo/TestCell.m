//
//  TestCell.m
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "TestCell.h"
#import <Masonry/Masonry.h>
#import "Define.h"
#import "TestModel.h"

@interface TestCell ()

@property (nonatomic, strong) UILabel *aLabel;
@property (nonatomic, strong) UILabel *bLabel;
@property (nonatomic, strong) UILabel *cLabel;

@end

@implementation TestCell

- (UILabel *)aLabel
{
    if (!_aLabel) {
        _aLabel = [[UILabel alloc] init];
        _aLabel.text = @"aLabel";
        _aLabel.textColor = [UIColor redColor];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat addFontSize = [defaults floatForKey:kFontSizeValue];
        _aLabel.font = Font(fontSize_12 + addFontSize);
        _aLabel.numberOfLines = 0;
    }
    return _aLabel;
}

- (UILabel *)bLabel
{
    if (!_bLabel) {
        _bLabel = [[UILabel alloc] init];
        _bLabel.text = @"bLabel";
        _bLabel.textColor = [UIColor orangeColor];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat addFontSize = [defaults floatForKey:kFontSizeValue];
        _bLabel.font = Font(fontSize_16 + addFontSize);
        _bLabel.numberOfLines = 0;
    }
    return _bLabel;
}

- (UILabel *)cLabel
{
    if (!_cLabel) {
        _cLabel = [[UILabel alloc] init];
        _cLabel.text = @"cLabel";
        _cLabel.textColor = [UIColor blueColor];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat addFontSize = [defaults floatForKey:kFontSizeValue];
        _cLabel.font = Font(fontSize_20 + addFontSize);
        _cLabel.numberOfLines = 0;
    }
    return _cLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createViews];
    }
    return self;
}

- (void)createViews
{
    [self.contentView addSubview:self.aLabel];
    [self.contentView addSubview:self.bLabel];
    [self.contentView addSubview:self.cLabel];
    
    [self.aLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.width.mas_equalTo(kScreenWidth/2.0);
        make.top.equalTo(@15);
    }];
    
    [self.bLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(self.aLabel);
        make.top.equalTo(self.aLabel.mas_bottom).mas_offset(20);
        make.bottom.equalTo(@-15);
    }];
    
    [self.cLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.aLabel.mas_trailing).mas_offset(10);
        make.trailing.equalTo(@-15);
        make.top.equalTo(@15);
        make.bottom.equalTo(@-15);
    }];
}

- (void)setModel:(TestModel *)model
{
    _model = model;
    self.aLabel.text = model.name;
    self.bLabel.text = model.detail;
    self.cLabel.text = model.descrip;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end
