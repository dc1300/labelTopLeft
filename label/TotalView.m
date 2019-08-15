//
//  TotalView.m
//  label
//
//  Created by 戴晨 on 2019/8/15.
//  Copyright © 2019 戴晨. All rights reserved.
//

#import "TotalView.h"
#import <Masonry/Masonry.h>
#import "UILabel+PFVAlignment.h"

@interface TotalView()


@property (nonatomic, strong)UILabel *titleLable;
@property (nonatomic, strong)UILabel *detailLable;

@end

@implementation TotalView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.titleLable];
        [self addSubview:self.detailLable];
        [self setLayout];
    }
    return self;
}

- (void)setLayout{
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(100);
        make.height.equalTo(@30);
//        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    [self.detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.titleLable.mas_right);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    
    self.detailLable.preferredMaxLayoutWidth = self.frame.size.width-105;//给一个maxWidth
    [self.detailLable setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];//设置huggingPriority
    self.detailLable.numberOfLines = 0;//设置换行

}

- (void)setUpTitle:(NSString *)title detailString:(NSString *)detailString{
    if (title.length != 0) {
        self.titleLable.text = [NSString stringWithFormat:@"%@",title];
    }else{
        self.titleLable.text = @"";
    }
    self.detailLable.text = detailString;
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.maximumLineHeight = 30;
    paragraphStyle.minimumLineHeight = 30;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    CGFloat baselineOffset = (30 - self.detailLable.font.lineHeight) / 4;
    [attributes setObject:@(baselineOffset) forKey:NSBaselineOffsetAttributeName];
    self.detailLable.attributedText = [[NSAttributedString alloc] initWithString:self.detailLable.text attributes:attributes];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLable textAlignmentLeftAndRight];
    
}
- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:16];
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.numberOfLines = 0;
    }
    return _titleLable;
}

- (UILabel *)detailLable{
    if (!_detailLable) {
        _detailLable = [[UILabel alloc]init];
        _detailLable.font = [UIFont systemFontOfSize:16];
        _detailLable.textColor = [UIColor blackColor];
        _detailLable.numberOfLines = 0;
    }
    return _detailLable;
}
@end
