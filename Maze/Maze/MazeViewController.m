//
//  ViewController.m
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "MazeViewController.h"
#import "GameScene.h"

@implementation MazeViewController

#pragma mark MazeDelegate

-(void)drawObjectAt:(struct MZPoint)point objectType:(MZObjectType)objectType{
    
    SKShapeNode *node = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(30, 30) cornerRadius:30 * 0.1];;
    node.position = CGPointMake(-280 + (point.y * 30 - 5), 260 - (point.x * 30 + 5));
    
    if (objectType == MZObjectWall) {
        node.lineWidth = 2.5;
    }else if (objectType == MZObjectTrace){
        node.position = CGPointMake(-260 + ((point.x - 1) * 30 + 5), 280 - ((point.y + 1) * 30 - 5));
        node.lineWidth = 5.0;
        node.strokeColor = [NSColor blueColor];
    }else if (objectType == MZObjectStart){
        node.fillColor = [NSColor greenColor];
    }else if (objectType == MZObjectTypeEnd){
        node.fillColor = [NSColor yellowColor];
    }
    [self.skView.scene addChild:node];
}

-(IBAction)solve:(id)sender{
    
    if ([self.maze.moves count] > 1 || [self.maze.stack count] > 1) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"You already solved the maze"];
        [alert addButtonWithTitle:@"Ok"];
        [alert runModal];
        return;
    }
    [self.maze mazeBegin:MZSolveModeDepth];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(makeNextMove) userInfo:nil repeats:YES];
}

-(void)makeNextMove{
    
    if (![self.maze isSolved]) {
        [self.maze DepthSolveMaze];
    }else{
        [self.timer invalidate];
    }
}

-(IBAction)drawMaze:(id)sender{
    
    if (self.maze.maze.count > 1) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"You already drew a maze"];
        [alert addButtonWithTitle:@"Ok"];
        [alert runModal];
        return;
    }
    
    NSString *filepath = [@"~/Desktop/mediumMaze.txt" stringByExpandingTildeInPath];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSLog(@"files: %@", allLinedStrings);
    
    self.maze = [[Maze alloc] init];
    self.maze.delegate = self;
    [self.maze convertArrayToMatrix:allLinedStrings];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [self.skView presentScene:scene];
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
}

@end
