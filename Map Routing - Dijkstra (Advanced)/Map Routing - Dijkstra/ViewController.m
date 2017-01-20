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

#pragma mark - SceneKit Delegate

-(void)setLocation:(float)x y:(float)y{
    
    if (self.start.x == 0 && self.start.y == 0) {
        self.start = [Vertex makeCoordinate:x y:y];
    }else{
        self.end = [Vertex makeCoordinate:x y:y];
    }
    
    if (self.start.x != 0 && self.start.y != 0 && self.end.x != 0 && self.end.y != 0) {
        
        Vertex *start = [self closest:self.start];
        Vertex *end = [self closest:self.end];
        [self path:start.key toKey:end.key];
    }
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(5, 5)];
    circle.strokeColor = [NSColor redColor];
    circle.fillColor = [NSColor redColor];
    circle.position = CGPointMake(x, y); //x: / 12.0 - 400.0 //y:   / 9.3 - 175.0
    [self.skView.scene addChild:circle];
}

#pragma mark - Actions

- (IBAction)draw:(id)sender {
    
    NSLog(@"%lu", (unsigned long)self.g.adjacencyList.allKeys.count);
    int i = 0;
    for (NSString *string in self.g.adjacencyList.allKeys) {
        Vertex *v = [self.g vertextForKey:string];
        if (i%25 == 0) {
            [self drawCities:v.coordinate withKey:string];
        }
        i++;
    }
}

- (IBAction)path:(id)sender {
    
    [self path:self.source.stringValue toKey:self.destination.stringValue];
}

#pragma mark - Private Helpers

-(void)path:(NSString *)start toKey:(NSString *)destination{
    
    [self.g dijkstra:start destination:destination];
    
    Vertex *vt = [self.g vertextForKey:destination];
    while (vt.previous) {
        NSLog(@"%@", vt.key);
        SKShapeNode *line = [SKShapeNode node];
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, vt.coordinate.x / 12.0 - 390.0, vt.coordinate.y / 9.3 - 170.0);
        CGPathAddLineToPoint(path, nil, vt.previous.coordinate.x / 12.0 - 390.0, vt.previous.coordinate.y / 9.3 - 170.0);
        [line setPath:path];
        line.lineWidth = 5;
        line.strokeColor = [NSColor redColor];
        [self.skView.scene addChild:line];
        
        vt = vt.previous;
    }
}

-(Vertex *)closest:(struct Coordinate)c{
    
    Vertex *v;
    SKNode *closest = [self.skView.scene.children objectAtIndex:0];
    float diff = [self distance:c.x y: c.y x2:closest.position.x y2:closest.position.y];
    
    for (SKNode *node in self.skView.scene.children) {
        
        float n = [self distance:c.x y: c.y x2:node.position.x y2:node.position.y];
        if (n < diff) {
            diff = n;
            closest = node;
            v = [self.g vertextForKey:node.name];
        }
    }
    NSLog(@"difference %f", diff);
    return v;
}

-(NSMutableArray *)retreiveCoordinates{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"usa" ofType:@"txt"];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    return [NSMutableArray arrayWithArray:allLinedStrings];
}

-(NSMutableArray *)retreiveEdges{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"edges" ofType:@"txt"];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    return [NSMutableArray arrayWithArray:allLinedStrings];
}

-(void)buildGraph{
    
    NSMutableArray *nodes = [self retreiveCoordinates];
    NSArray *edges = [nodes subarrayWithRange:NSMakeRange(87576, nodes.count - 87577)];

    //add all vertices
    for (int i = 0; i < 87575; i++) {
        NSMutableArray *values = [NSMutableArray arrayWithArray:[[nodes objectAtIndex:i] componentsSeparatedByString:@" "]];
        [values removeObject:@""];
        struct Coordinate c = [Vertex makeCoordinate:[[values objectAtIndex:1] floatValue] y:[[values lastObject] floatValue]];
        Vertex *v = [[Vertex alloc] initWithKey:[values objectAtIndex:0] cost:INT_MAX coordinate:c];
        [self.g addVertex:v];
    }
    
    //add all edges
    for (int i = 0; i < edges.count - 1; i++) {
        NSMutableArray *values = [NSMutableArray arrayWithArray:[[edges objectAtIndex:i] componentsSeparatedByString:@" "]];
        [values removeObject:@""];
        struct Coordinate s = [self.g vertextForKey:[values objectAtIndex:0]].coordinate;
        struct Coordinate e = [self.g vertextForKey:[values objectAtIndex:1]].coordinate;
        [self.g addEdge:[values objectAtIndex:0] toVert:[values objectAtIndex:1] weight:[self distance:s.x y:s.y x2:e.x y2:e.y]];
    }
}

-(float)distance:(float)x y:(float)y x2:(int)x2 y2:(int)y2{
    return sqrtf(pow(x + x2, 2.0) + pow(y + y2, 2.0));
}

-(void)drawCities:(struct Coordinate)c withKey:(NSString *)key{
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(3, 3)];
    circle.name = key;
    circle.strokeColor = [NSColor blackColor];
    circle.fillColor = [NSColor blackColor];
    circle.position = CGPointMake(c.x / 12.0 - 400.0, c.y / 9.3 - 175.0); //x:* 139 - 407 //y:  * 139 - 297
    [self.skView.scene addChild:circle];
}

- (void)viewDidLoad {
    
    // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
    // including entities and graphs.
    GKScene *scene = [GKScene sceneWithFileNamed:@"GameScene"];
    
    // Get the SKScene from the loaded GKScene
    GameScene *sceneNode = (GameScene *)scene.rootNode;
    sceneNode.sceneDelegate = self;
    
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
    //[self writeToFile];
    
    [super viewDidLoad];
}

-(void)writeToFile{
    
    NSMutableArray *array = [self retreiveCoordinates];
    [array removeObjectsInRange:NSMakeRange(90076, array.count - 1 - 90076)];
    [array removeObjectsInRange:NSMakeRange(0, 2001)];
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"/Users/Neil/maps-2.txt"];
    
    NSString * result = [[array valueForKey:@"description"] componentsJoinedByString:@"\n"];
    [result writeToFile:fileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end
