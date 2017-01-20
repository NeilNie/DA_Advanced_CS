//
//  ViewController.h
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/18/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <malloc/malloc.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import <limits.h>
#import "GameScene.h"
#import "Graph.h"
#import "Vertex.h"
#import "Heap.h"
#import "PQ.h"

@interface ViewController : NSViewController <SceneKitDelegate>

@property struct Coordinate start;
@property struct Coordinate end;
@property (weak) IBOutlet NSTextField *source;
@property (weak) IBOutlet NSTextField *destination;
@property (assign) IBOutlet SKView *skView;
@property (strong, nonatomic) Graph *g;

@end

