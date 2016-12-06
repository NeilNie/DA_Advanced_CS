//
//  ViewController.m
//  BST_Visual
//
//  Created by Yongyang Nie on 12/2/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "BSTViewController.h"
#import "GameScene.h"

@implementation BSTViewController

-(void)drawNode:(TreeNode *)node parent:(TreeNode *)parent isLeft:(int)isLeft currentHeight:(int)h{
    
    if (isLeft == 1) {
        node.position = CGPointMake(parent.position.x - 60 - pow(4, ([self.bst height] + 1) - h), -1 * h * 50);
    }else if (isLeft == 0){
        node.position = CGPointMake(parent.position.x + 60 + pow(4, ([self.bst height] + 1) - h), -1 * h * 50);
    }

    SKLabelNode *label = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"%i", node.value]];
    label.fontColor = [NSColor whiteColor];
    label.position = node.position;
    [self.skView.scene addChild:label];
    
    SKShapeNode *rightLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(40, 1.5) cornerRadius:0.3];
    rightLine.fillColor = [NSColor whiteColor];
    rightLine.strokeColor = [NSColor whiteColor];
    rightLine.lineWidth = 1.5;
    [rightLine runAction:[SKAction rotateByAngle:M_PI / 3 duration:0.0]];
    rightLine.position = CGPointMake(-label.frame.size.width/2, -13);
    [label addChild:rightLine];
    
    SKShapeNode *leftLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(40, 1.5) cornerRadius:0.3];
    leftLine.fillColor = [NSColor whiteColor];
    leftLine.strokeColor = [NSColor whiteColor];
    leftLine.lineWidth = 1.5;
    [leftLine runAction:[SKAction rotateByAngle:M_PI * 1.65 duration:0.0]];
    leftLine.position = CGPointMake(label.frame.size.width - 5, - 13);
    [label addChild:leftLine];

}

-(SKLabelNode *)findLabelNode:(int)x{
    
    SKLabelNode *parent;
    if (self.skView.scene.children.count > 0) {
        parent = (SKLabelNode *)[self.skView.scene.children objectAtIndex:0];
    }
         
    for (SKLabelNode *node in parent.children) {
        if ([node isKindOfClass:[SKLabelNode class]] && [node.text isEqualToString:[NSString stringWithFormat:@"%i", x]]) {
            return node;
        }
    }
    return NULL;
}

-(IBAction)move:(id)sender{
    [self.skView.scene removeAllChildren];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene
    [self.skView presentScene:scene];
    
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
    latestPosition = CGPointMake(0, 300);
    
    self.bst = [[BST alloc] initWithFileName:@"~/Desktop/tree.txt"];
    self.bst.delegate = self;
    [self.bst buildTree];
    NSLog(@"%i", [self.bst height]);
    [self.bst drawTree];
}

@end
