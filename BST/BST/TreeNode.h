//
//  TreeNode.h
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property int value;
@property (strong, nonatomic) TreeNode *leftChild;
@property (strong, nonatomic) TreeNode *rightChild;
@property CGPoint position;

//constructor
- (instancetype)initWithLeftChild:(TreeNode *)leftChild
                       rightChild:(TreeNode *)rightChild
                            value:(int)value;

-(void)addChild:(TreeNode *)node;

@end
