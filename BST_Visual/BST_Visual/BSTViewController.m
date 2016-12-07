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

-(void)drawNode:(TreeNode *)node parent:(TreeNode *)parent isLeft:(int)isLeft index:(int)index width:(int)width{
    
    if (isLeft == 1) {
        node.position = CGPointMake(parent.position.x - (80 * width / index), - index * 60 + 300);
    }else if (isLeft == 0){
        node.position = CGPointMake(parent.position.x + (80 * width / index), - index * 60 + 300);
    }
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(8, 8)];
    circle.lineWidth = 6;
    circle.position = CGPointMake(node.position.x, node.position.y + circle.yScale / 3);
    [self.skView.scene addChild:circle];
    
    if (isLeft != 2) {
        [self drawLine:parent.position toPoint:node.position];
    }
    
    self.avgHeight.stringValue = [NSString stringWithFormat:@"Average Height: %d", ([self.bst heightHelper:self.bst.root.rightChild] +
                                                                    [self.bst heightHelper:self.bst.root.leftChild]) / 2];
    self.maxHeight.stringValue = [NSString stringWithFormat:@"Max Height: %i", [self.bst height]];
    self.optHeight.stringValue = [NSString stringWithFormat:@"Opt Height: %f", log10f([self.bst size:self.bst.root]) / log10f(2)];
    self.size.stringValue = [NSString stringWithFormat:@"Size: %i", [self.bst size:self.bst.root]];
}

-(void)drawLine:(CGPoint)a toPoint:(CGPoint)b{
    
    float deltaX = a.x - b.x;
    float deltaY = a.y - b.y;
    float dist = sqrt(pow(deltaX, 2.0) + pow(deltaY, 2.0));
    
    float angle;
    if (deltaX != 0 && deltaY != 0) {
        angle = atanf(deltaY / deltaX);
    }
    
    SKShapeNode *leftLine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(dist, 1.5) cornerRadius:0.3];
    leftLine.fillColor = [NSColor whiteColor];
    leftLine.strokeColor = [NSColor whiteColor];
    leftLine.lineWidth = 1.5;
    [leftLine runAction:[SKAction rotateByAngle:angle duration:0.0]];
    
    leftLine.position = CGPointMake(a.x - deltaX / 2, a.y - 30);
    
    [self.skView.scene addChild:leftLine];
}

#pragma mark - IBActions

-(IBAction)move:(id)sender{
    [self.bst drawTree];
}

-(IBAction)reset:(id)sender{
    
    [self.skView.scene removeAllChildren];
    self.bst = [[BST alloc] initWithFileName:[[NSBundle mainBundle] pathForResource:@"tree" ofType:@"txt"]];
    self.bst.delegate = self;
    [self.bst buildTree];
    
    while ([self.bst size:self.bst.root] < 80) {
        int x = arc4random()%200;
        [self.bst insert:x];
    }
    [self.bst drawTree];
}

-(IBAction)insertValue:(id)sender{
    
    [self.bst insert:[self.textField.stringValue intValue]];
    [self.skView.scene removeAllChildren];
    [self.bst drawTree];
}

#pragma mark - Life Cycle

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
    
    self.bst = [[BST alloc] initWithFileName:[[NSBundle mainBundle] pathForResource:@"tree" ofType:@"txt"]];
    self.bst.delegate = self;
    [self.bst buildTree];
    
    while ([self.bst size:self.bst.root] < 80) {
        int x = arc4random()%200;
        [self.bst insert:x];
    }
}

@end
