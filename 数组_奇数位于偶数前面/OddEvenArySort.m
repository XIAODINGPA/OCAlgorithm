//
//  OddEvenArySort.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/16.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "OddEvenArySort.h"

@implementation OddEvenArySort

+ (void)testMain
{
    NSArray * ary = @[@1, @2, @3, @4, @5, @6, @7, @8, @0];
//    NSArray * ary = @[@1, @2, @1, @2, @1, @2, @1, @2, @0];
//    NSArray * ary = @[@1, @2, @3, @4, @5, @6, @7, @8, @0];
    
    NSLog(@"%@", [self sortByOddEvenWithMutableArray:ary.mutableCopy]);
}

+ (NSArray *)sortByOddEvenWithMutableArray:(NSMutableArray *)array
{
    if ([array isMemberOfClass:[NSArray class]]) {
        
        array = array.mutableCopy;
    }
    
    if (array.count == 0) {
        
        NSLog(@"数组非法!");
        
        return @[];
    }
    
    NSInteger start = 0;
    NSInteger end = array.count - 1;
    NSInteger compare = end;
    
    while (start < end) {
        
        while (start < end && [array[start] integerValue] % 2 != 0) {
            
            start++;
        }
        
        [array exchangeObjectAtIndex:start withObjectAtIndex:compare];
        compare = start;
        
        while (start < end && [array[end] integerValue] % 2 == 0) {
            
            end--;
        }
        
        [array exchangeObjectAtIndex:end withObjectAtIndex:compare];
        compare = end;
    }
    
    return array.copy;
}

@end
