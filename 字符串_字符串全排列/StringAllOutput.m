//
//  StringAllOutput.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/24.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "StringAllOutput.h"

@implementation StringAllOutput

+ (void)testMain
{
    [self stringAllOutput:@"123"];
//    [self stringAllOutput:@"1234"];
//    [self stringAllOutput:@"123"];
}

+ (void)stringAllOutput:(NSString *)string
{
    NSMutableArray * stringAry = @[].mutableCopy;
    
    for (NSInteger i = 0; i < string.length; i++) {
        
        [stringAry addObject:[NSString stringWithFormat:@"%c", [string characterAtIndex:i]]];
    }
    
    [self stringAllOutputWithCharArray:stringAry start:0];
}

+ (void)stringAllOutputWithCharArray:(NSMutableArray <NSString *> *)charAry start:(NSInteger)start
{
    if (start == charAry.count - 1) {
        
        NSMutableString * string = @"".mutableCopy;
        
        [charAry enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * stop) {
            
            [string appendString:obj];
        }];
        
        NSLog(@"start %@", string);
    }
    
    for (NSInteger i = start; i < charAry.count; i++) {
        
        [charAry exchangeObjectAtIndex:start withObjectAtIndex:i];
        [self stringAllOutputWithCharArray:charAry start:start + 1];
        [charAry exchangeObjectAtIndex:start withObjectAtIndex:i];
    }
}

@end
