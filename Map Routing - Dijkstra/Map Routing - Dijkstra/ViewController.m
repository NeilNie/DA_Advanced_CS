//
//  ViewController.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/18/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@implementation ViewController

-(NSMutableArray *)retreiveWordsLocal:(NSString *)name{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    return [NSMutableArray arrayWithArray:allLinedStrings];
}

-(void)buildGraph{
    
    NSMutableArray *array = [self retreiveWordsLocal:@"Small"];
    NSArray *nodes = [array subarrayWithRange:NSMakeRange(0, [array indexOfObject:@"ARCS"])];
    NSArray *edges = [array subarrayWithRange:NSMakeRange([array indexOfObject:@"ARCS"] + 1, array.count - [array indexOfObject:@"ARCS"] + 1 - 2)];
    
    //add all vertices
    for (int i = 0; i < nodes.count; i++) {
        NSArray *values = [[nodes objectAtIndex:i] componentsSeparatedByString:@" "];
        Vertex *v = [[Vertex alloc] initWithKey:[values objectAtIndex:0] cost:INT_MAX coordinate:[Vertex makeCoordinate:[[values objectAtIndex:1] floatValue] y:[[values objectAtIndex:2] floatValue]]];
        [self.g addVertex:v];
    }
    
    //add all edges
    for (int i = 0; i < edges.count - 1; i++) {
        NSArray *values = [[edges objectAtIndex:i] componentsSeparatedByString:@" "];
        [self.g addEdge:[values objectAtIndex:0] toVert:[values objectAtIndex:1] weight:[[values objectAtIndex:2] intValue]];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.g = [[Graph alloc] init];
    [self buildGraph];
    [self.g dijkstra:@"Minneapolis" destination:@"WashingtonDC"];
    
    
    // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
    // including entities and graphs.
    GKScene *scene = [GKScene sceneWithFileNamed:@"GameScene"];
    
    // Get the SKScene from the loaded GKScene
    GameScene *sceneNode = (GameScene *)scene.rootNode;
    
    // Copy gameplay related content over to the scene
    sceneNode.entities = [scene.entities mutableCopy];
    sceneNode.graphs = [scene.graphs mutableCopy];
    
    // Set the scale mode to scale to fit the window
    sceneNode.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene
    [self.skView presentScene:sceneNode];
    
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end
