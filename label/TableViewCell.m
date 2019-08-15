//
//  TableViewCell.m
//  label
//
//  Created by 戴晨 on 2019/8/15.
//  Copyright © 2019 戴晨. All rights reserved.
//

#import "TableViewCell.h"
#import "TotalView.h"
#import "model.h"
#import <Masonry/Masonry.h>
#import "NSString+Extensions.h"

@interface TableViewCell ()

@property (nonatomic, strong) TotalView *totalView;
@property (nonatomic, strong) TotalView *totalView1;
@property (nonatomic, strong) TotalView *totalView2;
@property (nonatomic, strong) TotalView *totalView3;
@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width =  [UIApplication sharedApplication].keyWindow.frame.size.width-30;
        self.totalView = [[TotalView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
        self.totalView1 = [[TotalView alloc]initWithFrame:CGRectMake(0, 30, width, 30)];
        self.totalView2 = [[TotalView alloc]initWithFrame:CGRectMake(0, 60, width, 30)];
        self.totalView3 = [[TotalView alloc]initWithFrame:CGRectMake(0, 90, width, 30)];
        [self.contentView addSubview:self.totalView];
        [self.contentView addSubview:self.totalView1];
        [self.contentView addSubview:self.totalView2];
        [self.contentView addSubview:self.totalView3];
        
        [self.totalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top);
            make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.height.mas_greaterThanOrEqualTo(30);
        }];
        [self.totalView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.totalView.mas_bottom);
            make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.height.mas_greaterThanOrEqualTo(30);
        }];
        [self.totalView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.totalView1.mas_bottom);
            make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.height.mas_greaterThanOrEqualTo(30);
        }];
        [self.totalView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.totalView2.mas_bottom);
            make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
           make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}

- (void)setModel:(model *)model{
    _model = model;

    [self.totalView setUpTitle:@"机构名：" detailString:[NSString checkEmptyFromThing:model.orgName]];
    [self.totalView1 setUpTitle:@"承兑行：" detailString:[NSString checkEmptyFromThing:model.draweeBank]];
    if ([model.dealDate isEqualToString:@"2019/20/02"]) {
        [self.totalView2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        self.totalView2.hidden = YES;
    }else{
        self.totalView2.hidden = NO;
    }
    [self.totalView2 setUpTitle:@"交易日期：" detailString:[NSString checkEmptyFromThing:model.dealDate]];
    [self.totalView3 setUpTitle:@"备注：" detailString:[NSString checkEmptyFromThing:model.remark]];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
