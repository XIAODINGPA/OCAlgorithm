//
//  DelRptNodes.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/3.
//  Copyright © 2018年 Logger. All rights reserved.
//
//  在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。
//  例如，链表1->2->3->3->4->4->5
//  处理后为 1->2->5

#import "DelRptNodes.h"

@implementation DelRptNodes

+ (void)testMain
{
//    NSArray * ary = @[@1, @2, @3, @3, @3, @3, @4, @4, @4, @1, @1, @1, @1];
//    NSArray * ary = @[@2, @2, @2, @2, @2, @2];
    NSArray * ary = @[@1, @2, @3, @3, @3, @3];
    
    Node * node = [Node new];
    node.value = ary.firstObject;
    
    Node * head = node;
    
    for (NSInteger i = 1; i < ary.count; i++) {
        
        node.next = [Node new];
        node.next.value = ary[i];
        
        node = node.next;
    }
    
    Node * del_p = [self deleltRepeatNodes:head];
    
    while (del_p) {
        
        NSLog(@"%@", del_p.value);
        
        del_p = del_p.next;
    }
}

+ (Node *)deleltRepeatNodes:(Node *)node
{
    Node * firstNode = [Node new];
    firstNode.next = node;
    
    Node * p = node;
    Node * last = firstNode;    ///< 不用记录是否是单重复 [2, 2, 2, 2]
    
    while (p && p.next) {
        
        if ([p.value isEqualToNumber:p.next.value]) {
            
            NSNumber * number = p.value;
            
            while ([p.value isEqualToNumber:number]) {
                
                p = p.next;
            }
            
            last.next = p;
        }
        else {
            
            last = p;
            p = p.next;
        }
    }
    
    return firstNode.next;
}

@end
