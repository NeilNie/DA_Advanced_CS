//
//  BST.m
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "BST.h"

@implementation BST

#pragma mark - Public Methods

-(int)height{
    return [self heightHelper:self.root];
}

-(void)insert:(int)object{
    
    TreeNode *node = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:object];
    [self insertHelper:self.root insertNode:node];
}

-(void)remove:(int)object{
    
    TreeNode *rmParent = [self parentOf:object node:self.root];
    TreeNode *rmNode = [self findNode:self.root object:object];

    if (rmParent.leftChild.value == rmNode.value){
        if (rmNode.leftChild) {
            rmParent.leftChild = rmNode.rightChild;
            TreeNode *leaf = [self findLeftLeaf:rmNode.rightChild];
            leaf.leftChild = rmNode.leftChild;
            rmNode = nil;
        }else
            rmParent.leftChild = rmNode.leftChild;
        
    }else if (rmParent.rightChild.value == rmNode.value){
        if (rmNode.leftChild) {
            rmParent.rightChild = rmNode.rightChild;
            TreeNode *leaf = [self findLeftLeaf:rmNode.rightChild];
            leaf.leftChild = rmNode.leftChild;
            rmNode = nil;
        }else
            rmParent.rightChild = rmNode.leftChild;
    }
}

-(void)betterRemove:(int)object{
    
    TreeNode *rmParent = [self parentOf:object node:self.root];
    
    if (rmParent.rightChild.value == object){
        TreeNode *leaf = [self findLeftLeaf:rmParent.rightChild.rightChild];
        rmParent.rightChild.value = leaf.value;
        leaf = nil;
    }else if (rmParent.leftChild.value == object){
        TreeNode *leaf = [self findLeftLeaf:rmParent.leftChild.rightChild];
        rmParent.leftChild.value = leaf.value;
        leaf = nil;
    }
}

-(BOOL)contains:(int)object{
    return [self containsHelper:self.root object:object];
}

#pragma mark - Traversal

-(void)preorderTraversal{
    [self preorderTraversalHelper:self.root];
}

-(void)postorderTraversal{
    [self postorderTraversalHelper:self.root];
}

-(void)inorderTravesal{
    [self inorderTraversalHelper:self.root];
}

#pragma mark - Private Helpers

-(TreeNode *)findLeftLeaf:(TreeNode *)node{
    
    if (node.leftChild)
        return [self findLeftLeaf:node.leftChild];
    return node;
}

-(TreeNode *)parentOf:(int)x node:(TreeNode *)node {
    
    if (x < node.leftChild.value && node.leftChild.leftChild)
        return [self parentOf:x node:node.leftChild];
    else if (x > node.rightChild.value && node.rightChild.rightChild)
        return [self parentOf:x node:node.rightChild];
    else
        return node;
}

-(TreeNode *)findNode:(TreeNode *)node object:(int)x{
    
    if (x < node.value && node.leftChild)
        return [self findNode:node.leftChild object:x];
    else if (x > node.value&& node.rightChild)
        return [self findNode:node.rightChild object:x];
    else
        return node;
}

-(BOOL)containsHelper:(TreeNode *)node object:(int)x{
    
    if (x < node.value)
        return node.leftChild && [self containsHelper:node.leftChild object:x];
    else if (x > node.value)
        return node.rightChild && [self containsHelper:node.rightChild object:x];
    else
        return YES;
}

-(void)preorderTraversalHelper:(TreeNode *)node{
    
    NSLog(@"%i", node.value);
    if (node.leftChild)
        [self preorderTraversalHelper:node.leftChild];
    if (node.rightChild)
        [self preorderTraversalHelper:node.rightChild];
}

-(void)postorderTraversalHelper:(TreeNode *)node{
    
    if (node.leftChild)
        [self postorderTraversalHelper:node.leftChild];
    if (node.rightChild)
        [self postorderTraversalHelper:node.rightChild];
    NSLog(@"%i", node.value);
}

-(void)inorderTraversalHelper:(TreeNode *)node{
    
    if (node.leftChild)
        [self inorderTraversalHelper:node.leftChild];
    NSLog(@"%i", node.value);
    if (node.rightChild)
        [self inorderTraversalHelper:node.rightChild];
}

-(void)insertHelper:(TreeNode *)node insertNode:(TreeNode *)insert{
    
    if (self.root) {
        if (!node.leftChild || !node.rightChild)
            [node addChild:insert];
        else{
            if (insert.value > node.value){
                [self insertHelper:node.rightChild insertNode:insert];
                [self.delegate drawNode:insert.value isLeft:NO];
            }else if (insert.value < node.value){
                [self insertHelper:node.leftChild insertNode:insert];
                [self.delegate drawNode:insert.value isLeft:YES];
            }
        }
    }else
        self.root = insert;
}

-(int)heightHelper:(TreeNode *)node{
    
    if (node.leftChild)
        return 1 + [self heightHelper:node.leftChild];
    if (node.rightChild)
        return 1 + [self heightHelper:node.rightChild];
    return 1;
}

-(void)buildTree:(NSArray *)array{
    
    for (NSString *number in array)
        [self insert:[number intValue]];
}

#pragma mark - Constructors

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFileName:(NSString *)file{
    
    self = [super init];
    if (self) {
        NSString *filepath = [file stringByExpandingTildeInPath];
        NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSLog(@"%@", allLinedStrings);
        [self buildTree:allLinedStrings];
    }
    return self;
}

@end
