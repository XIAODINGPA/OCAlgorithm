//
//  RevolvingArray.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/16.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "RevolvingArray.h"

@implementation RevolvingArray

+ (void)testMain
{
//    NSArray * ary = @[@3, @4, @5, @1, @2];
//    NSArray * ary = @[@5, @6, @7, @8, @1, @2, @3, @4];
//    NSArray * ary = @[@8, @0, @1, @2, @3, @4, @5, @6, @7];
    NSArray * ary = @[@1, @2, @3, @4, @5, @6, @7, @8, @0];
//    NSArray * ary = @[@0, @1, @2, @3, @4, @5, @6, @7, @8];
    
    NSLog(@"%@", [self searchMinValueWithRevolvingArray:ary]);
}

//+ (NSNumber *)searchMinValueWithRevolvingArray:(NSArray *)array
//{
//    if (array.count == 0) {
//        
//        return nil;
//    }
//    
//    if ([array.firstObject floatValue] < [array.lastObject floatValue]) {
//        
//        NSLog(@"该数组不是旋转数组");
//        
//        return nil;
//    }
//    
//    for (NSInteger i = 0; i < array.count; i++) {
//        
//        NSInteger j = i + 1;
//        
//        if (j < array.count && [array[i] floatValue] > [array[j] floatValue]) {
//            
//            return array[j];
//        }
//    }
//    
//    return nil;
//}

+ (NSNumber *)searchMinValueWithRevolvingArray:(NSArray *)array
{
    if (array.count == 0) {

        return nil;
    }

    NSInteger start = 0;
    NSInteger end = array.count - 1;
    NSInteger mid = 0;

    if ([array[start] floatValue] < [array[end] floatValue]) {

        NSLog(@"该数组不是旋转数组");

        return nil;
    }

    while (start < end) {

        mid = (start + end) / 2;

        if (end - start == 1) {

            mid = start + 1;

            break;
        }

        if ([array[mid] floatValue] > [array[end] floatValue]) {

            start = mid;
        }
        else {

            end = mid;
        }
    }

    return array[mid];
}

@end
