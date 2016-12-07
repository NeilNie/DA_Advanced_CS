//
//  BST.m
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "BST.h"

@interface BST (){
    NSArray *array;
}

@end

@implementation BST

#pragma mark - Public Methods

-(void)drawTree{
    
//    float leftWidth = [self width:self.root.leftChild];
//    float rightWidth = [self width:self.root.rightChild];
//    
//    float average = 1200 / (leftWidth + rightWidth);
    
    self.root.position = CGPointMake(0, 300);
    [self.delegate drawNode:self.root parent:nil isLeft:2 index:0 width:[self width:self.root] + 1];
    
    [self drawTreeHelper:self.root index:1];
}

-(void)drawTreeHelper:(TreeNode *)node index:(int)index{
    
    if (node.rightChild){
        [self.delegate drawNode:node.rightChild parent:node isLeft:0 index:index width:[self width:node.rightChild.leftChild] + 1];
        [self drawTreeHelper:node.rightChild index:index + 1];
    }
    
    if (node.leftChild){
        [self.delegate drawNode:node.leftChild parent:node isLeft:1 index:index width:[self width:node.leftChild.rightChild] + 1];
        [self drawTreeHelper:node.leftChild index:index + 1];
    }
}

-(int)width:(TreeNode *)node{
    if (node.rightChild && node.leftChild) {
        return 1 + MAX([self width:node.rightChild], [self width:node.leftChild]);
    }
    return 0;
}

-(int)height{
    return [self heightHelper:self.root];
}

-(int)heightHelper:(TreeNode *)node{
    
    if (node.leftChild && node.rightChild)
        return 1 + MAX([self heightHelper:node.leftChild], [self heightHelper:node.rightChild]);
    else if (!node.leftChild && node.rightChild)
        return 1 + [self heightHelper:node.rightChild];
    else if (!node.rightChild && node.leftChild)
        return 1 + [self heightHelper:node.leftChild];
    return 0;
}

-(void)insert:(int)object{
    
    TreeNode *node = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:object];
    
    if (!self.root){
        self.root = node;
        return;
    }
    if (![self contains:object])
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

//http://cslibrary.stanford.edu/109/TreeListRecursion.html
/*
 Here's the formal problem statement: Write a recursive function treeToList(Node root) that takes an ordered binary tree and rearranges the internal pointers to make a circular doubly linked list out of the tree nodes. The "previous" pointers should be stored in the "small" field and the "next" pointers should be stored in the "large" field. The list should be arranged so that the nodes are in increasing order. Return the head pointer to the new list. The operation can be done in O(n) time -- essentially operating on each node once. Basically take figure-1 as input and rearrange the pointers to make figure-2.
 Try the problem directly, or see the hints below.
 */

-(void)treeToList{
    [self treeToListHelper:self.root];
}

#pragma mark - Private Helpers

-(int)size:(TreeNode *)node{
    
    int left = 0, right = 0;
    if (node.leftChild)
        left = [self size:node.leftChild];
    else if ([node isEqual:self.root] && (!node.rightChild || !node.leftChild))
        @throw [NSException exceptionWithName:@"Unbalanced tree" reason:@"The tree has no left branch. Please rebalance the tree" userInfo:nil];
    
    if (node.rightChild)
        right = [self size:node.rightChild];
    else if ([node isEqual:self.root] && (!node.rightChild || !node.leftChild))
        @throw [NSException exceptionWithName:@"Unbalanced tree" reason:@"The tree has no right branch. Please rebalance the tree" userInfo:nil];
    
    return left + right + 1;
}

-(void)join:(TreeNode *)a withNode:(TreeNode *)b{
    a.rightChild = b;
    b.leftChild = a;
}
-(TreeNode *)append:(TreeNode *)a withNode:(TreeNode *)b{
    if (!a) return b;
    if (!b) return a;
    
    TreeNode *aEnd = a.leftChild;
    TreeNode *bEnd = b.leftChild;
    
    [self join:aEnd withNode:b];
    [self join:bEnd withNode:a];
    
    return a;
}
-(TreeNode *)treeToListHelper:(TreeNode *)node{
    
    TreeNode *sList = [self treeToListHelper:node.leftChild];
    TreeNode *bList = [self treeToListHelper:node.rightChild];
    
    node.leftChild = node;
    node.rightChild = node;
    
    sList = [self append:sList withNode:node];
    sList = [self append:sList withNode:bList];
    
    return sList;
}

-(TreeNode *)findLeftLeaf:(TreeNode *)node{
    
    if (node.leftChild) return [self findLeftLeaf:node.leftChild];
    return node;
}

-(TreeNode *)parentOf:(int)x node:(TreeNode *)node {
    
    if (x < node.leftChild.value && node.leftChild.leftChild)
        return [self parentOf:x node:node.leftChild];
    else if (x > node.rightChild.value && node.rightChild.rightChild)
        return [self parentOf:x node:node.rightChild];
    else return node;
}

-(TreeNode *)findNode:(TreeNode *)node object:(int)x{
    
    if (x < node.value && node.leftChild)
        return [self findNode:node.leftChild object:x];
    else if (x > node.value&& node.rightChild)
        return [self findNode:node.rightChild object:x];
    else return node;
}

-(BOOL)containsHelper:(TreeNode *)node object:(int)x{
    
//    if (![node isEqual:self.root] && (!node.leftChild || !node.rightChild) && [self height] != 0)
//        @throw [NSException exceptionWithName:@"Unbalanced tree" reason:@"The tree is not balanced, therefore can not perform searches." userInfo:nil];
    if (x < node.value)
        return node.leftChild && [self containsHelper:node.leftChild object:x];
    else if (x > node.value)
        return node.rightChild && [self containsHelper:node.rightChild object:x];
    else return YES;
}

-(void)preorderTraversalHelper:(TreeNode *)node{
    
    NSLog(@"%i", node.value);
    if (node.leftChild)  [self preorderTraversalHelper:node.leftChild];
    if (node.rightChild) [self preorderTraversalHelper:node.rightChild];
}

-(void)postorderTraversalHelper:(TreeNode *)node{
    
    if (node.leftChild)  [self postorderTraversalHelper:node.leftChild];
    if (node.rightChild) [self postorderTraversalHelper:node.rightChild];
    NSLog(@"%i", node.value);
}

-(void)inorderTraversalHelper:(TreeNode *)node{
    
    if (node.leftChild)  [self inorderTraversalHelper:node.leftChild];
    NSLog(@"%i", node.value);
    if (node.rightChild) [self inorderTraversalHelper:node.rightChild];
}

-(void)insertHelper:(TreeNode *)node insertNode:(TreeNode *)insert{
    
    if (!node.leftChild || !node.rightChild){
        if (insert.value < node.value)
            node.leftChild = insert;
        else
            node.rightChild = insert;
    }else{
        if (insert.value > node.value)
            [self insertHelper:node.rightChild insertNode:insert];
        else if (insert.value < node.value)
            [self insertHelper:node.leftChild insertNode:insert];
    }
}

-(void)buildTree{
    for (NSString *number in array)
        [self insert:[number intValue]];
}

#pragma mark - Constructors

-(instancetype)initWithFileName:(NSString *)file{
    
    self = [super init];
    if (self) {
        NSString *filepath = [file stringByExpandingTildeInPath];
        array = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    }
    return self;
}

@end
