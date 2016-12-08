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


/** Methods **/

-(int)width:(TreeNode *)node;

-(void)buildTree;

-(instancetype)initWithFileName:(NSString *)file;

-(int)height;

-(void)insert:(NSString *)object;

-(void)remove:(NSString *)object;

-(BOOL)contains:(NSString *)object;

-(void)preorderTraversal;

-(void)postorderTraversal;

-(void)inorderTravesal;

-(void)betterRemove:(NSString *)object;

-(int)size:(TreeNode *)node;

-(int)heightHelper:(TreeNode *)node;

@end

@protocol BSTDelegate <NSObject>

-(void)drawNode:(TreeNode *)node parent:(TreeNode *)parent isLeft:(int)isLeft index:(int)index width:(int)width;

@end
