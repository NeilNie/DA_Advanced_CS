//
//  ViewController.h
//  BST_Visual
//
//  Created by Yongyang Nie on 12/2/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "BST.h"

@interface BSTViewController : NSViewController <BSTDelegate>{
    CGPoint latestPosition;
    SKLabelNode *lastestNode;
    
}

@property (assign) IBOutlet SKView *skView;

@property (strong) BST *bst;

@end

