//
//  ArraySolution.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/10.
//  Copyright © 2018年 Logger. All rights reserved.
//
//  在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。
//  请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

#import "ArraySolution.h"

@implementation ArraySolution

+ (void)testMain
{
    NSArray * array = @[@[@1, @2,  @8,  @9],
                        @[@2, @4,  @9, @12],
                        @[@4, @7, @10, @13],
                        @[@6, @8, @11, @15]];
    
    NSLog(@"find number result %zd", [self solutionArrayFindNumber:@15 array:array]);
    NSLog(@"find number result %zd", [self solutionArrayFindNumber:@5 array:array]);
}

+ (BOOL)solutionArrayFindNumber:(NSNumber *)number array:(NSArray *)array
{
    /**
     * 锁定右上角
     */
    NSInteger index_row = [array.firstObject count] - 1;
    NSInteger index_section = 0;
    
#define CURR_NUMBER  array[index_section][index_row]
    
    while (index_section < array.count &&
           index_row >= 0 &&
           index_row < [array[index_section] count]) {
        
        if ([CURR_NUMBER floatValue] == [number floatValue]) {
            
            return YES;
        }
        
        if ([CURR_NUMBER floatValue] > number.floatValue) {
            
            index_row--;
        }
        else {
            
            index_section++;
        }
    }
    
    return NO;
}

@end
