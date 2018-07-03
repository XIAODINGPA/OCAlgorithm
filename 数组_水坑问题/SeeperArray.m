//
//  SeeperArray.m
//  OCAlgorithm
//
//  Created by huangshun on 2018/7/3.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "SeeperArray.h"

@implementation SeeperArray

+ (void)testMain
{
    NSLog(@"----%zd", [self seeper:@[@0, @1, @0, @2, @1, @0, @1, @3, @2, @1, @2, @1].mutableCopy]);
}

+ (NSInteger)seeper:(NSMutableArray <NSNumber *> *)array
{
    BOOL isSplit = YES;
    NSInteger seeper = 0;

    while (isSplit) {

        NSMutableArray * splitAry = @[].mutableCopy;

        isSplit = NO;

        for (NSInteger i = 0; i < array.count; i++) {

            NSNumber * number = array[i];
            splitAry[i] = number.integerValue > 0 ? @1 : @0;
            array[i] = number.integerValue > 0 ? @(array[i].integerValue - 1) : @0;

            if (array[i].integerValue > 0) {

                isSplit = YES;
            }
        }

        seeper += [self seeperFor01Ary:splitAry];
    }

    return seeper;
}

+ (NSInteger)seeperFor01Ary:(NSArray <NSNumber *> *)array
{
    if (array.count > 0) {

        NSInteger start = 0;
        NSInteger end = array.count - 1;

        while (array[start].integerValue == 0 && start < array.count - 1) {
            start++;
        }

        while (array[end].integerValue == 0 && end > 0) {
            end--;
        }

        if (start == end || start > end) {
            return 0;
        }

        NSInteger seeper = 0;

        for (NSInteger i = start; i < end; i++) {

            if (array[i].integerValue == 0) {

                seeper++;
            }
        }

        return seeper;
    }

    return 0;
}

@end
