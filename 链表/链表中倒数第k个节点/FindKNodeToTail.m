//
//  FindKNodeToTail.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/4/11.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "FindKNodeToTail.h"
#import "Node.h"

@implementation FindKNodeToTail

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
    
    NSLog(@"%@", [[self findKToTail:3 head:head] value]);
}

+ (Node *)findKToTail:(NSInteger)count head:(Node *)head
{
    if (head == nil) {
        
        return nil;
    }
    
    Node * slow = head;
    Node * fast = head;
    
    while (count > 1) {
        
        if (fast == nil) {
            
            return nil;
        }
        
        fast = fast.next;
        count--;
    }
    
    while (fast.next) {
        
        fast = fast.next;
        slow = slow.next;
    }
    
    return slow;
}

@end
