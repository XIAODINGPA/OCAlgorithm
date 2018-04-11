//
//  MergeSort.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/8.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+ (void)testMain
{
    NSMutableArray * ary = @[@2, @1, @3, @(-1), @1, @10, @9, @1, @1, @1, @2, @2, @2, @2, @3, @-1, @-1].mutableCopy;
//            NSMutableArray * ary = @[@1, @1, @1, @1, @1, @1].mutableCopy;
//            NSMutableArray * ary = @[].mutableCopy;
//            NSMutableArray * ary = @[@1, @2, @3, @4, @5, @6].mutableCopy;
    
    NSLog(@"%@", [self mergeWithMutableArray:ary]);
}

+ (NSArray *)mergeWithMutableArray:(NSMutableArray *)array
{
    if ([array isMemberOfClass:[NSArray class]]) {
        
        array = array.mutableCopy;
    }
    
    NSMutableArray * posArray = array.mutableCopy;
    
    [self mergeWithArray:array positionAry:posArray start:0 end:array.count - 1];
    
    return array.copy;
}

+ (void)mergeWithArray:(NSMutableArray *)array positionAry:(NSMutableArray *)positionAry start:(NSInteger)start end:(NSInteger)end
{
    if (start < end) {
        
        NSInteger mid = (start + end) / 2;
        
        [self mergeWithArray:array positionAry:positionAry start:start end:mid];
        [self mergeWithArray:array positionAry:positionAry start:mid + 1 end:end];
        [self merge:array positionAry:positionAry start:start mid:mid end:end];
    }
}

+ (void)merge:(NSMutableArray *)array positionAry:(NSMutableArray *)positionAry start:(NSInteger)start mid:(NSInteger)mid end:(NSInteger)end
{
    NSInteger i = start;
    NSInteger j = mid + 1;
    NSInteger k = start;
    
    while (i <= mid && j <= end) {
        
        if ([array[i] floatValue] < [array[j] floatValue]) {
            
            positionAry[k++] = array[i++];
        }
        else {
            
            positionAry[k++] = array[j++];
        }
    }
    
    while (i <= mid) {
        
        positionAry[k++] = array[i++];
    }
    
    while (j <= end) {
        
        positionAry[k++] = array[j++];
    }
    
    for (NSInteger z = start; z <= end; z++) {
        
        array[z] = positionAry[z];
    }
}

@end
