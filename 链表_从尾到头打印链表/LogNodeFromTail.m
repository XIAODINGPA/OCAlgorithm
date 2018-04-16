//
//  LogNodeFromTail.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/16.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "LogNodeFromTail.h"

@implementation LogNodeFromTail

+ (void)testMain
{
    NSArray * ary = @[@1, @2, @3, @4, @5, @6, @7, @8, @9];
    
    Node * node = [Node new];
    node.value = ary.firstObject;
    
    Node * head = node;
    
    for (NSInteger i = 1; i < ary.count; i++) {
        
        node.next = [Node new];
        node.next.value = ary[i];
        
        node = node.next;
    }
    
    [self logNodeFromTail:head];
}

+ (void)logNodeFromTail:(Node *)node
{
    NSMutableArray <Node *> * ary = @[].mutableCopy;
    
    while (node) {
        
        [ary addObject:node];
        node = node.next;
    }
    
    if (ary.count) {
        
        for (NSInteger i = ary.count - 1; i >= 0; i--) {
            
            NSLog(@"%@", ary[i].value);
        }
    }
}

//+ (void)logNodeFromTail:(Node *)node
//{
//    if (node) {
//
//        [self logNodeFromTail:node.next];
//
//        NSLog(@"%@", node.value);
//    }
//}

@end
