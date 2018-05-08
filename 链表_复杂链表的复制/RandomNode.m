//
//  RandomNode.m
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/5/7.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "RandomNode.h"

@implementation RandomNode

+ (void)testMain
{
    RandomNode * node1 = [RandomNode new];
    node1.value = @1;
    
    RandomNode * node2 = [RandomNode new];
    node2.value = @2;
    
    RandomNode * node3 = [RandomNode new];
    node3.value = @3;
    
    RandomNode * node4 = [RandomNode new];
    node4.value = @4;
    
    RandomNode * node5 = [RandomNode new];
    node5.value = @5;
    
    RandomNode * node6 = [RandomNode new];
    node6.value = @6;
    
    node1.randomNode = node4;
    node3.randomNode = node2;
    node4.randomNode = node6;
    node6.randomNode = node1;
    
    NSArray * nodes = @[node1, node2, node3,
                        node4, node5, node6];
    
    for (NSInteger i = 0; i < nodes.count; i++) {
        
        Node * node = nodes[i];
        node.next = i + 1 >= nodes.count ? nil : nodes[i + 1];
    }
    
    [self logRandomNode:node1];
    
    NSLog(@"----------------------------");
    
	[self logRandomNode:[self copyRandomNode:node1]];
}

+ (void)logRandomNode:(RandomNode *)node
{
    RandomNode * copy = node;
    
    while (node) {
        
        NSLog(@"node value is : %@, random value is : %@", node.value, node.randomNode.value);
        
        node = (RandomNode *)node.next;
    }
    
    while (copy) {

        NSLog(@"node is : %p, random is : %p", copy, copy.randomNode);

        copy = (RandomNode *)copy.next;
    }
}

/** 关联法 */
+ (RandomNode *)copyRandomNode:(RandomNode *)node
{
    RandomNode * head = node;
    
    while (node) {  // 两个链表关联
        
        RandomNode * copyNode = [RandomNode new];
        copyNode.next = node.next;
        copyNode.value = node.value;
    
        node.next = copyNode;
        node = (RandomNode *)copyNode.next;
    }
    
    RandomNode * copy_head = head;
    
    while (copy_head) { // 依次指向随机node
        
        if (copy_head.randomNode) {
            
            [(RandomNode *)copy_head.next setRandomNode:copy_head.randomNode.next];
        }
        
        copy_head = (RandomNode *)copy_head.next.next;
    }
    
    copy_head = head;
    
    RandomNode * new_head = (RandomNode *)copy_head.next;
    
    Node * new_node = [RandomNode new];
    Node * new_copy_node = new_node;
    
    while (copy_head && new_node) {     // 拆分两个链表
        
        Node * node = copy_head.next;
        new_copy_node.next = node;
        
        copy_head.next = copy_head.next.next;
        copy_head = (RandomNode *)copy_head.next;

        new_copy_node = new_copy_node.next;
    }
    
    return new_head;
}

/** hash 对应法 */
//+ (RandomNode *)copyRandomNode:(RandomNode *)node
//{
//    RandomNode * copyHead = [RandomNode new];
//    RandomNode * copyNode = copyHead;
//
//    // 保留head寻找使用
//    RandomNode * randomNode = node;
//
//    NSMutableArray * old_node_ary = @[].mutableCopy;
//    NSMutableArray * new_node_ary = @[].mutableCopy;
//
//    while (node) {  // 复制
//
//        copyNode.next = [RandomNode new];
//        copyNode.next.value = node.value;
//
//        // 拷贝对应关系
//        [old_node_ary addObject:node];
//        [new_node_ary addObject:copyNode.next];
//
//        node = (RandomNode *)node.next;
//        copyNode = (RandomNode *)copyNode.next;
//    }
//
//    // 二次寻找使用
//    RandomNode * randomCopyNode = (RandomNode *)copyHead.next;
//
//    while (randomNode && randomCopyNode) {
//
//        if (randomNode.randomNode) {
//
//            NSUInteger index = [old_node_ary indexOfObject:randomNode.randomNode];
//            randomCopyNode.randomNode = [new_node_ary objectAtIndex:index];
//        }
//
//        randomNode = (RandomNode *)randomNode.next;
//        randomCopyNode = (RandomNode *)randomCopyNode.next;
//    }
//
//    return (RandomNode *)copyHead.next;
//}

/** 暴力法 */
//+ (RandomNode *)copyRandomNode:(RandomNode *)node
//{
//    RandomNode * copyHead = [RandomNode new];
//    RandomNode * copyNode = copyHead;
//
//    // 保留head寻找使用
//    RandomNode * randomNode = node;
//
//    while (node) {  // 复制
//
//        copyNode.next = [RandomNode new];
//        copyNode.next.value = node.value;
//
//        node = (RandomNode *)node.next;
//        copyNode = (RandomNode *)copyNode.next;
//    }
//
//    // 二次寻找使用
//    RandomNode * randomCopyNode = (RandomNode *)copyHead.next;
//
//    RandomNode * new_head = (RandomNode *)copyHead.next;
//    RandomNode * old_head = randomNode;
//
//    while (randomNode && randomCopyNode) {
//
//        if (randomNode.randomNode) {    // 寻找随机node
//
//            RandomNode * copy_new_head = new_head;
//            RandomNode * copy_old_head = old_head;
//
//            while (copy_new_head && copy_old_head) {
//
//                if ([randomNode.randomNode isEqual:copy_old_head]) {
//
//                    randomCopyNode.randomNode = copy_new_head;
//                    break;
//                }
//
//                copy_new_head = (RandomNode *)copy_new_head.next;
//                copy_old_head = (RandomNode *)copy_old_head.next;
//            }
//        }
//
//        randomNode = (RandomNode *)randomNode.next;
//        randomCopyNode = (RandomNode *)randomCopyNode.next;
//    }
//
//    return (RandomNode *)copyHead.next;
//}

@end
