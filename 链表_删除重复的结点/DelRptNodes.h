//
//  DelRptNodes.h
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/3.
//  Copyright © 2018年 Logger. All rights reserved.
//
//  在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。
//  例如，链表1->2->3->3->4->4->5
//  处理后为 1->2->5

#import <Foundation/Foundation.h>
#import "Node.h"

@interface DelRptNodes : NSObject

+ (void)testMain;

+ (Node *)deleltRepeatNodes:(Node *)node;

@end
