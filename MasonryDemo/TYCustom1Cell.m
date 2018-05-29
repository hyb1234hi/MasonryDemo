//
//  TYCustom1Cell.m
//  MasonryDemo
//
//  Created by Tiny on 2018/5/29.
//  Copyright © 2018年 hxq. All rights reserved.
//

#import "TYCustom1Cell.h"
#import "Masonry.h"

@interface TYCustom1Cell ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *textLb;


@end

@implementation TYCustom1Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *label = [UILabel new];
    label.text = @"1xe1";
    label.textColor = [UIColor blackColor];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    
    UIButton *showMore = [UIButton new];
    [showMore setTitle:@"查看更多" forState:UIControlStateNormal];
    showMore.titleLabel.font = [UIFont systemFontOfSize:14];
    [showMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:showMore];
    [showMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(label.mas_bottom);
        make.height.mas_equalTo(33);
    }];
    [showMore addTarget:self action:@selector(showMoreAction) forControlEvents:UIControlEventTouchUpInside];
    self.containerView = [UIView new];
    [self.contentView addSubview:self.containerView];
    UILabel *textLb = [UILabel new];
    self.textLb = textLb;
    textLb.numberOfLines = 0;
    [self.containerView addSubview:textLb];
    [textLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    self.containerView.clipsToBounds = YES;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(showMore.mas_bottom);
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(-10);
        
    }];
}

-(void)showMoreAction{
    self.model.isShowMore = !self.model.isShowMore;
    
    if (self.expendBlock) {
        self.expendBlock();
    }
}

-(void)setModel:(TYCustom1Model *)model{
    _model = model;
    self.textLb.text = model.text;
    if (model.isShowMore) {
        [self.textLb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_offset(0);
        }];
    }else{
        [self.textLb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_offset(0);
            make.height.mas_equalTo(0);
        }];
    }
}

@end
