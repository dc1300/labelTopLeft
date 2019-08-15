//
//  TableViewCell.h
//  label
//
//  Created by 戴晨 on 2019/8/15.
//  Copyright © 2019 戴晨. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class model;
@interface TableViewCell : UITableViewCell

@property (nonatomic, strong)model *model;
@end

NS_ASSUME_NONNULL_END
