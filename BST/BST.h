//
//  BST.h
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@interface BST : NSObject

/** Properties **/

@property (strong, nonatomic) id delegate;

@property (strong, nonatomic) TreeNode *root;

@property (strong, nonatomic) NSMutableArray <TreeNode *>*leaves;

/** Methods **/

-(void)drawTree;

-(int)width:(TreeNode *)node;

-(void)buildTree;

-(instancetype)initWithFileName:(NSString *)file;

-(int)height;

-(void)insert:(int)object;

-(void)remove:(int)object;

-(BOOL)contains:(int)object;

-(void)preorderTraversal;

-(void)postorderTraversal;

-(void)inorderTravesal;

-(void)betterRemove:(int)object;

-(int)size:(TreeNode *)node;

-(int)heightHelper:(TreeNode *)node;

@end

@protocol BSTDelegate <NSObject>

-(void)drawNode:(TreeNode *)node parent:(TreeNode *)parent isLeft:(int)isLeft index:(int)index width:(int)width;

@end
