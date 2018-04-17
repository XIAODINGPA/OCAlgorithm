//
//  MathPower.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/17.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "MathPower.h"

@implementation MathPower

+ (void)testMain
{
    NSLog(@"%f", [self power:2 exponent:2]);
    NSLog(@"%f", [self power:2 exponent:4]);
    NSLog(@"%f", [self power:2 exponent:-2]);
}

+ (CGFloat)power:(CGFloat)base exponent:(NSInteger)exponent
{
    if (exponent == 0) {
        
        return 1.0f;
    }
    
    if (base == 0 && exponent < 0) {
        
        NSLog(@"异常");
        
        return .0f;
    }
    
    if (exponent > 0) {
        
        return [self powerNormal:base exponent:exponent];
    }
    else {
        
        CGFloat ref = 1.0f / [self powerNormal:base exponent:-exponent];
        
        return ref;
    }
}

+ (CGFloat)powerNormal:(CGFloat)base exponent:(NSInteger)exponent
{
    CGFloat ref = 1.0f;
    
    while (exponent != 0) {
        
        if (exponent & 1) {
            
            ref *= base;
        }
        
        base *= base;
        
        exponent >>= 1;
    }
    
    return ref;
}

@end
