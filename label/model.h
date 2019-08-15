//
//  model.h
//  label
//
//  Created by 戴晨 on 2019/8/15.
//  Copyright © 2019 戴晨. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface model : NSObject

@property (nonatomic, copy)NSString * orgName;
@property (nonatomic, copy) NSString *draweeBank;
@property (nonatomic, copy)NSString * dealDate;
@property (nonatomic, copy)NSString * remark;

@end

NS_ASSUME_NONNULL_END
