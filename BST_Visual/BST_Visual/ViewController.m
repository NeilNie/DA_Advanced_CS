//
//  ViewController.m
//  BST_Visual
//
//  Created by Yongyang Nie on 12/2/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@implementation ViewController

-(void)drawNode:(int)value isLeft:(BOOL)isLeft{
    
    // Create shape node to use during mouse interaction
    SKShapeNode *leftLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(50, 2) cornerRadius:0.3];
    leftLine.lineWidth = 2.5;
    SKShapeNode *rightLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(50, 2) cornerRadius:0.3];
    rightLine.lineWidth = 2.5;
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
    
    self.bst = [[BST alloc] initWithFileName:@"~/Desktop/tree.txt"];
    self.bst.delegate = self;
    nodePositionX = 0;
    nodePostiionY = 0;
    
    SKShapeNode *rightLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(50, 2) cornerRadius:0.3];
    rightLine.fillColor = [NSColor whiteColor];
    rightLine.strokeColor = [NSColor whiteColor];
    rightLine.lineWidth = 2.5;
    [rightLine runAction:[SKAction rotateByAngle:M_PI / 4 duration:0.0]];
    [self.skView.scene addChild:rightLine];
    
    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"3"];
    label.fontColor = [NSColor whiteColor];
    [self.skView.scene addChild:label];
}

@end
