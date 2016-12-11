//
//  ViewController.h
//  Animal
//
//  Created by Yongyang Nie on 12/6/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BST.h"
#import <Realm/Realm.h>

@interface AnimalViewController : NSViewController

@property (strong) BST *tree;
@property (strong) TreeNode *currentNode;
@property (weak) IBOutlet NSTextView *response;
@property (weak) IBOutlet NSTextField *userInput;

@end

