//
//  main.m
//  BST
//
//  Created by Yongyang Nie on 11/29/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BST.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BST *bst = [[BST alloc] initWithFileName:@"~/Desktop/tree.txt"];
        [bst buildTree];
        NSLog(@"%i", [bst height]);
        NSLog(@"%@", bst.root);
        NSLog(@"Preorder");
        [bst preorderTraversal];
        NSLog(@"Postorder");
        [bst postorderTraversal];
        NSLog(@"Inorder");
        [bst inorderTravesal];
        NSLog(@"contains: %i", [bst contains:55]);
        NSLog(@"width: %i", [bst width:bst.root.leftChild]);
    }
    return 0;
}
