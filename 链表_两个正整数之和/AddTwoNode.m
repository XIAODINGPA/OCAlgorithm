//
//  AddTwoNode.m
//  OCAlgorithm
//
//  Created by huangshun on 2018/7/3.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "AddTwoNode.h"

@implementation AddTwoNode

+ (void)testMain
{
    // 输入 1 -> 2 -> 3 -> 4
    // 输入           3 -> 4
    // 输出 1 -> 2 -> 6 -> 8

    NSArray * ary1 = @[@1, @2, @3, @4];
    NSArray * ary2 = @[@3, @4];

    Node * node = [Node new];
    node.value = ary1.firstObject;
    Node * head1 = node;
    for (NSInteger i = 1; i < ary1.count; i++) {
        node.next = [Node new];
        node.next.value = ary1[i];
        node = node.next;
    }

    node = [Node new];
    node.value = ary2.firstObject;
    Node * head2 = node;
    for (NSInteger i = 1; i < ary2.count; i++) {
        node.next = [Node new];
        node.next.value = ary2[i];
        node = node.next;
    }

    Node * add = [self node:head1 add:head2];

    while (add) {

        NSLog(@"%@", add.value);
        add = add.next;
    }
}

+ (Node *)node:(Node *)node1 add:(Node *)node2
{
    Node * node1_start = node1;
    Node * node2_start = node2;

    NSInteger node1_count = 0;
    NSInteger node2_count = 0;

    while (node1_start) {
        node1_count++;
        node1_start = node1_start.next;
    }

    while (node2_start) {
        node2_count++;
        node2_start = node2_start.next;
    }

    if (node1_count == 0 && node2_count == 0) {

        return nil;
    }

    Node * longNode, * shortNode;

    if (node1_count > node2_count) {

        longNode = node1;
        shortNode = node2;
    }
    else {

        longNode = node2;
        shortNode = node1;
    }

    NSInteger abs = ABS(node2_count - node1_count);

    Node * addNodeStart = longNode;

    while (abs > 0) {

        longNode = longNode.next;
        abs--;
    }

    while (longNode && shortNode) {

        longNode.value = @(longNode.value.integerValue + shortNode.value.integerValue);
        longNode = longNode.next;
        shortNode = shortNode.next;
    }

    return addNodeStart;
}

@end
