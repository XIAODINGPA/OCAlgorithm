//
//  RandomNode.h
//  OCAlgorithm
//
//  Created by 黄舜 on 2018/5/7.
//  Copyright © 2018年 Logger. All rights reserved.
//

#import "Node.h"

@interface RandomNode : Node

@property (nonatomic, strong) Node * randomNode;

+ (void)testMain;

+ (RandomNode *)copyRandomNode:(RandomNode *)node;

@end
