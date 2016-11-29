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
    
}

-(void)remove:(int)object{
    
}

-(void)contains:(int)object{
    
}

#pragma mark - Traversal

-(void)preorderTraversal{
    
}

-(void)postorderTraversal{
    
}

-(void)inorderTravesal{
    
}

#pragma mark - Private Helpers

-(int)heightHelper:(TreeNode *)node{
    
    if (node.leftChild)
        return 1 + [self heightHelper:node.leftChild];
    if (node.rightChild)
        return 1 + [self heightHelper:node.rightChild];
    return 1;
}

-(void)buildTree:(NSString *)string{
    
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
        NSString* fileContent = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"files: %@", fileContent);
        [self buildTree:fileContent];
        TreeNode *node = [[TreeNode alloc] initWithParent:nil leftChild:nil rightChild:nil value:4];
    }
    return self;
}

@end
