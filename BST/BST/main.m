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
        NSLog(@"%@", bst.root);
        NSLog(@"Preorder");
        [bst preorderTraversal];
        NSLog(@"Postorder");
        [bst postorderTraversal];
        NSLog(@"Inorder");
        [bst inorderTravesal];
        NSLog(@"contains: %i", [bst contains:55]);
        NSLog(@"Begin removing");
        [bst remove:20];
        NSLog(@"Inorder");
        [bst inorderTravesal];
    }
    return 0;
}
