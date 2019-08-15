//
//  ViewController.m
//  label
//
//  Created by 戴晨 on 2019/8/15.
//  Copyright © 2019 戴晨. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "model.h"
#import <YYModel/YYModel.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    model *model1 = [[model alloc]init];
    model1.orgName = @"中国银行";
    model1.draweeBank = @"上海国利货币经纪上海国利货币经纪上海国利货币经纪上海国利货币经纪";
    model1.dealDate = @"2019/20/01";
    model1.remark = @"";
    [self.dataSource addObject:model1];
    
    model *model2 = [[model alloc]init];
    model2.orgName = @"中国银行1";
    model2.draweeBank = @"上海国利货币经纪上海国利货币经纪上海国利货币经纪上海国利货币经纪币经纪上海国利货币经纪上海国利货币经纪币经纪上海国利货币经纪上海国利货币经纪币经纪上海国利货币经纪上海国利货币经纪币经纪上海国利货币经纪上海国利货币经纪";
    model2.dealDate = @"2019/20/02";
    model2.remark = @"zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司";
    [self.dataSource addObject:model2];
    
    model *model3 = [[model alloc]init];
    model3.orgName = @"中国银行3";
    model3.draweeBank = @"上海国利货币";
    model3.dealDate = @"2019/20/03";
    model3.remark = @"上海国利货上海国利货";
    [self.dataSource addObject:model3];
    
    model *model4 = [[model alloc]init];
    model4.orgName = @"zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司zwb机构名称很长很长的中国银行有限公司";
    model4.draweeBank = @"上海国利货币经纪上海国利货币经纪上海国利货币经纪上海国利货币经纪";
    model4.dealDate = @"2019/20/04";
    model4.remark = @"";
    [self.dataSource addObject:model4];
    
    [self.tableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.estimatedRowHeight = 60;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

@end
