//
//  ViewController.h
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "Maze.h"

@interface MazeViewController : NSViewController <MazeDelegate>

@property (strong) NSTimer *timer;
@property (strong) Maze *maze;
@property (weak) IBOutlet NSPopUpButton *selectMode;
@property (weak) IBOutlet NSPopUpButton *selectSize;
@property (assign) IBOutlet SKView *skView;

@end

