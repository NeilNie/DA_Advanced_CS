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
        // insert code here...
        NSLog(@"Hello, World!");
        
        BST *bst = [[BST alloc] initWithFileName:@"~/Desktop/tree.txt"];
        NSLog(@"%@", bst.root);
        NSLog(@"Preorder");
        [bst preorderTraversal];
        NSLog(@"Postorder");
        [bst postorderTraversal];
        NSLog(@"Inorder");
        [bst inorderTravesal];
    }
    return 0;
}
