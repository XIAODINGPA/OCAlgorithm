//
//  LogAllNumber.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/26.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "LogAllNumber.h"

@implementation LogAllNumber

+ (void)testMain
{
    [self stringAllOutput:@1];
    
    NSLog(@"----------------------");
    
	[self stringAllOutput:@2];
    
    NSLog(@"----------------------");
    
	[self stringAllOutput:@3];
}

+ (void)stringAllOutput:(NSNumber *)figures
{
    NSMutableArray * ary = @[].mutableCopy;
    
    for (NSInteger i = 0; i < figures.integerValue; i++) {
        
        ary[i] = @(0);
    }
    
    for (NSInteger i = 0; i < 10; i++) {

        ary[0] = @(i);
        [self logToMaxOfNDigitsRecursively:ary index:0];
    }
}

+ (void)logToMaxOfNDigitsRecursively:(NSMutableArray *)array index:(NSInteger)index
{
    if (index == array.count - 1) {
        
        NSMutableString * string = @"".mutableCopy;
        
        [array enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * stop) {
            
            [string appendString:obj.stringValue];
        }];
        
        NSLog(@"string : %@", string);
        
        return;
    }
    
    for (NSInteger i = 0; i < 10; i++) {
        
        array[index + 1] = @(i);
        [self logToMaxOfNDigitsRecursively:array index:index + 1];
    }
}

@end
