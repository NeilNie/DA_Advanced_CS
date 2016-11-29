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

@property (strong, nonatomic) TreeNode *root;

@property (strong, nonatomic) NSMutableArray <TreeNode *>*leaves;

/** Methods **/

-(instancetype)initWithFileName:(NSString *)file;

-(int)height;

-(void)insert:(int)object;

-(void)remove:(int)object;

-(void)contains:(int)object;

-(void)preorderTraversal;

-(void)postorderTraversal;

-(void)inorderTravesal;

@end
