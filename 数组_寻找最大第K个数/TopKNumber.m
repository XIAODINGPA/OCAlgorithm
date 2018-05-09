//
//  TopKNumber.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/5/9.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "TopKNumber.h"

@implementation TopKNumber

+ (void)testMain
{
//    NSMutableArray * ary = @[@2, @1, @3, @(-1), @1, @10, @9, @1, @1, @1, @2, @2, @2, @2, @3, @-1, @-1].mutableCopy;
    //    NSMutableArray * ary = @[@1, @1, @1, @1, @1, @1].mutableCopy;
    //    NSMutableArray * ary = @[].mutableCopy;
        NSMutableArray * ary = @[@1, @2, @3, @4, @5, @6].mutableCopy;
    
    NSLog(@"%@", [self findTopKNumberWithIndex:0 array:ary]);
}

+ (NSNumber *)findTopKNumberWithIndex:(NSInteger)index array:(NSMutableArray *)array
{
    return [self findTopK:index left:0 right:array.count - 1 array:array];
}

+ (NSNumber *)findTopK:(NSInteger)k left:(NSInteger)left right:(NSInteger)right array:(NSMutableArray *)array
{
    if (k >= array.count) {
        
        NSLog(@"error");
        
        return nil;
    }
    
    NSInteger index = [self partition:array left:left right:right];
    
    if (index == k) {
        
        return array[k];
    }
    
    else if (k > index) {
        
        return [self findTopK:k left:index + 1 right:right array:array];
    }
    else /* (k < index) */ {
        
        return [self findTopK:k left:left right:index - 1 array:array];
    }
}

+ (NSInteger)partition:(NSMutableArray *)array left:(NSInteger)left right:(NSInteger)right
{
    NSInteger compare = left;
    
    while (left < right) {
        
        while (left < right &&
               [array[right] floatValue] <= [array[compare] floatValue]) {
            
            right--;
        }
        
        [array exchangeObjectAtIndex:compare withObjectAtIndex:right];
        compare = right;
        
        while (left < right &&
               [array[left] floatValue] >= [array[compare] floatValue]) {
            
            left++;
        }
        
        [array exchangeObjectAtIndex:compare withObjectAtIndex:left];
        compare = left;
    }
    
    return compare;
}

@end
