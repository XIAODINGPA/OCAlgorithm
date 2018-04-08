//
//  QuickSort.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/8.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

+ (void)testMain
{
    NSMutableArray * ary = @[@2, @1, @3, @(-1), @1, @10, @9, @1, @1, @1, @2, @2, @2, @2, @3, @-1, @-1].mutableCopy;
//    NSMutableArray * ary = @[@1, @1, @1, @1, @1, @1].mutableCopy;
//    NSMutableArray * ary = @[].mutableCopy;
//    NSMutableArray * ary = @[@1, @2, @3, @4, @5, @6].mutableCopy;
    
    NSLog(@"%@", [self quickSortWithMutableArray:ary]);
}

+ (NSArray *)quickSortWithMutableArray:(NSMutableArray *)array
{
    if ([array isMemberOfClass:[NSArray class]]) {
        
        array = array.mutableCopy;
    }
    
    [self quickSortWithArray:array start:0 end:array.count - 1];
    
    return array.copy;
}

+ (void)quickSortWithArray:(NSMutableArray <NSNumber *> *)array start:(NSInteger)start end:(NSInteger)end
{
    if (end < start) {
        
        return;
    }
    
    NSInteger left = start;
    NSInteger right = end;
    NSInteger compare = left;
    
    while (left < right) {
        
        while (left < right && [array[compare] floatValue] <= [array[right] floatValue]) {
            
            right--;
        }
        
        [array exchangeObjectAtIndex:compare withObjectAtIndex:right];
        compare = right;
        
        while (left < right && [array[compare] floatValue] >= [array[left] floatValue]) {
            
            left++;
        }
        
        [array exchangeObjectAtIndex:compare withObjectAtIndex:left];
        compare = left;
    }
    
    [self quickSortWithArray:array start:start end:compare - 1];
    [self quickSortWithArray:array start:compare + 1 end:end];
}

@end
