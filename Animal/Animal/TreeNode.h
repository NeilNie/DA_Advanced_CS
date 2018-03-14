//
//  TreeNode.h
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface TreeNode : RLMObject

@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) TreeNode *leftChild;
@property (strong, nonatomic) TreeNode *rightChild;

//constructor
- (instancetype)initWithLeftChild:(TreeNode *)leftChild
                       rightChild:(TreeNode *)rightChild
                            value:(NSString *)value;

-(void)addChild:(TreeNode *)node;

@end
