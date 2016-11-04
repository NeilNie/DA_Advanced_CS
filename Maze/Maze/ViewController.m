//
//  ViewController.m
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //Maze *maze = [[Maze alloc] initWithText:@"####################S#...............##.#.###.#.##########...#...#.........##.###.#########.#.##.#...#.......#.#.##.#####.#####.###.##...#.......#.#...####.#.#####.#.#.#.##...#.#...#.#.#.#.####.#.#.#.#.#.#.#.##...#...#.#.#...#.##.#######.##########.......#.#.......######.#.#.#.#####.##...#.#.#...#...#.##.###.#.#####.#.#.##.....#.......#.#E####################" rowLength:19];
    //Maze *maze = [[Maze alloc] initWithText:@"#######S##.##.##E####" rowLength:3];
    Maze *maze = [[Maze alloc] initWithText:@"#########S...#####.#...###.##.###..#.#####...#E###.#...#########" rowLength:8];
    
    [maze mazeBegin:MZSolveModeBreadth];
    NSLog(@"");
    [maze BreadthSolveMaze];
    [maze.moves print];
    NSLog(@"");
    
//    // Load the SKScene from 'GameScene.sks'
//    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
//    
//    // Set the scale mode to scale to fit the window
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene
//    [self.skView presentScene:scene];
//    
//    self.skView.showsFPS = YES;
//    self.skView.showsNodeCount = YES;
}

@end