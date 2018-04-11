//
//  HeapSort.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/8.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "HeapSort.h"

@implementation HeapSort

+ (void)testMain
{
    NSMutableArray * ary = @[@2, @1, @3, @(-1), @1, @10, @9, @1, @1, @1, @2, @2, @2, @2, @3, @-1, @-1].mutableCopy;
//        NSMutableArray * ary = @[@1, @1, @1, @1, @1, @1].mutableCopy;
//        NSMutableArray * ary = @[].mutableCopy;
//        NSMutableArray * ary = @[@1, @2, @3, @4, @5, @6].mutableCopy;
    
    NSLog(@"%@", [self heapSortWithMutableArray:ary]);
}

+ (NSArray *)heapSortWithMutableArray:(NSMutableArray *)array
{
    if ([array isMemberOfClass:[NSArray class]]) {
        
        array = array.mutableCopy;
    }
    
    for (NSInteger i = array.count / 2; i >= 0; i--) {
        
        [self largeHeapWithMutableArray:array start:i length:array.count];
    }
    
    for (NSInteger i = array.count - 1; i >= 0; i--) {
        
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        [self largeHeapWithMutableArray:array start:0 length:i];
    }
    
    return array.copy;
}

+ (void)largeHeapWithMutableArray:(NSMutableArray *)array start:(NSInteger)start length:(NSInteger)length
{
    NSInteger parent = start;
    NSInteger child = parent * 2 + 1;
    
    while (child < length) {
        
        if (child + 1 < length && [array[child + 1] floatValue] > [array[child] floatValue]) {
            
            child = child + 1;
        }
        
        if ([array[parent] floatValue] > [array[child] floatValue]) {
            
            break;
        }
        else {
            
            [array exchangeObjectAtIndex:parent withObjectAtIndex:child];
            parent = child;
            child = parent * 2 + 1;
        }
    }
}

@end
