//
//  ReverseNode.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/23.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "ReverseNode.h"

@implementation ReverseNode

+ (void)testMain
{
    //    NSArray * ary = @[@1, @2, @3, @3, @3, @3, @4, @4, @4, @1, @1, @1, @1];
    //    NSArray * ary = @[@2, @2, @2, @2, @2, @2];
    NSArray * ary = @[@1, @2, @3, @4, @5, @6, @7, @8, @9];
    
    Node * node = [Node new];
    node.value = ary.firstObject;
    
    Node * head = node;
    
    for (NSInteger i = 1; i < ary.count; i++) {
        
        node.next = [Node new];
        node.next.value = ary[i];
        
        node = node.next;
    }
    
    Node * reverse = [self reverseNode:head];
    
    while (reverse) {
        
        NSLog(@"%@", reverse.value);
        reverse = reverse.next;
    }
}

+ (Node *)reverseNode:(Node *)node
{
    Node * before = nil;
    Node * current = node;
    Node * next = node.next;
    
    while (current) {
        
        current.next = before;
        
        before = current;
        current = next;
        next = next.next;
    }
    
    return before;
}

@end
