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
    
    TreeNode *node = [[TreeNode alloc] initWithParent:nil leftChild:nil rightChild:nil value:object];
    [self insertHelper:self.root insertNode:node];
}

-(void)remove:(int)object{
    
}

-(void)contains:(int)object{
    
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
            if (insert.value > node.value) {
                [self insertHelper:node.rightChild insertNode:insert];
            }
            else if (insert.value < node.value)
                [self insertHelper:node.leftChild insertNode:insert];
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
