//
//  NSString+Extensions.m
//  PurangFinanceVillage-Bank
//
//  Created by wangyilu on 16/1/27.
//  Copyright © 2016年 ___PURANG___. All rights reserved.
//

#import "NSString+Extensions.h"
#import <CommonCrypto/CommonDigest.h>

static inline BOOL ThingIsEmpty (id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

@implementation NSString (Extensions)
+ (BOOL)isBlankStringWith:(id)str {
    
    return ThingIsEmpty(str);
}
+ (NSString *)checkEmptyFromThing:(id)thing{
    NSString *string = nil;
    if ([NSString isBlankStringWith:thing]) {
        string = @"--";
    }else{
        string = [NSString stringWithFormat:@"%@",thing];
    }
    return string;
}
@end
