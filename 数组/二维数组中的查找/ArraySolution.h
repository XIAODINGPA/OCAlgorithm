//
//  ArraySolution.h
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/10.
//  Copyright © 2018年 Logger. All rights reserved.
//
//  在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。
//  请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

#import <Foundation/Foundation.h>

@interface ArraySolution : NSObject

+ (void)testMain;

+ (BOOL)solutionArrayFindNumber:(NSNumber *)number array:(NSArray *)array;

@end
