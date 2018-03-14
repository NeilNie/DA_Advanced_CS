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

#pragma mark - Actions

- (IBAction)path:(id)sender {
    
    [self.g dijkstra:self.source.stringValue destination:self.destination.stringValue];
    
    Vertex *vt = [self.g vertextForKey:self.destination.stringValue];
    while (vt.previous) {
        NSLog(@"%@", vt.key);
        SKShapeNode *line = [SKShapeNode node];
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, vt.coordinate.x * 139 - 407, vt.coordinate.y * 139 - 297);
        CGPathAddLineToPoint(path, nil, vt.previous.coordinate.x * 139 - 407, vt.previous.coordinate.y * 139 - 297);
        [line setPath:path];
        line.lineWidth = 5;
        line.strokeColor = [NSColor redColor];
        [self.skView.scene addChild:line];
        
        vt = vt.previous;
    }
}


#pragma mark - Private Helpers

-(NSMutableArray *)retreiveWordsLocal:(NSString *)name{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    return [NSMutableArray arrayWithArray:allLinedStrings];
}

-(void)buildGraph{
    
    NSMutableArray *array = [self retreiveWordsLocal:@"USA-full"];
    NSArray *nodes = [array subarrayWithRange:NSMakeRange(0, [array indexOfObject:@"ARCS"])];
    NSArray *edges = [array subarrayWithRange:NSMakeRange([array indexOfObject:@"ARCS"] + 1, array.count - [array indexOfObject:@"ARCS"] + 1 - 2)];
    
    //add all vertices
    for (int i = 0; i < nodes.count; i++) {
        NSArray *values = [[nodes objectAtIndex:i] componentsSeparatedByString:@" "];
        struct Coordinate c = [Vertex makeCoordinate:[[values objectAtIndex:1] floatValue] y:[[values objectAtIndex:2] floatValue]];
        Vertex *v = [[Vertex alloc] initWithKey:[values objectAtIndex:0] cost:INT_MAX coordinate:c];
        [self drawCities:c withName:[values objectAtIndex:0]];
        [self.g addVertex:v];
    }
    
    //add all edges
    for (int i = 0; i < edges.count - 1; i++) {
        NSArray *values = [[edges objectAtIndex:i] componentsSeparatedByString:@" "];
        [self.g addEdge:[values objectAtIndex:0] toVert:[values objectAtIndex:1] weight:[[values objectAtIndex:2] intValue]];
    }
}

-(void)drawCities:(struct Coordinate)c withName:(NSString *)name{
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(10, 10)];
    circle.strokeColor = [NSColor blackColor];
    circle.fillColor = [NSColor blackColor];
    circle.position = CGPointMake(c.x * 139 - 407, c.y * 139 - 297);
    
    SKLabelNode *label = [SKLabelNode labelNodeWithText:name];
    label.fontName = @"Helvetica Bold";
    label.fontSize = 13;
    label.fontColor = [NSColor blackColor];
    label.position = CGPointMake(circle.position.x, circle.position.y - 20);
    
    [self.skView.scene addChild:label];
    [self.skView.scene addChild:circle];
}

- (void)viewDidLoad {
    
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
    
    self.g = [[Graph alloc] init];
    [self buildGraph];
    
    [super viewDidLoad];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end
