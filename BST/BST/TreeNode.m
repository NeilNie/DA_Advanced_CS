//
//  TreeNode.m
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithParent:(TreeNode *)parent
                     leftChild:(TreeNode *)leftChild
                    rightChild:(TreeNode *)rightChild
                         value:(int)value
{
    self = [super init];
    if (self) {
        self.parent = parent;
        self.leftChild = leftChild;
        self.rightChild = rightChild;
        self.value = value;
    }
    return self;
}

-(void)addChild:(TreeNode *)node{
    
    if (node.value > self.value)
        self.rightChild = node;
    else
        self.leftChild = node;
    
    node.parent = self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"\n ----------- \n value: %i \n left child: %@ \n right child: %@ \n", self.value, self.leftChild, self.rightChild];
}

@end
