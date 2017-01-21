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
    
    if (self.start.x == 0 && self.start.y == 0)
        self.start = [Vertex makeCoordinate:x y:y];
    else
        self.end = [Vertex makeCoordinate:x y:y];
    
    if (self.start.x != 0 && self.start.y != 0 && self.end.x != 0 && self.end.y != 0) {
        
        Vertex *start = [self closest:self.start];
        Vertex *end = [self closest:self.end];
        
        [self path:start.key toKey:end.key];
    }
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(5, 5)];
    circle.strokeColor = [NSColor redColor];
    circle.fillColor = [NSColor redColor];
    circle.position = CGPointMake(x, y);
    [self.skView.scene addChild:circle];
}

#pragma mark - Actions

- (IBAction)clear:(id)sender {
    
    NSDate *method2Start = [NSDate date];
    self.g = [[Graph alloc] init];
    [self buildGraph];
    [self.skView.scene removeAllChildren];
    [self loadScene];
    [self draw:nil];
    
    self.opTimeLabel.stringValue = @"Opertion Time:";
    self.distanceLabel.stringValue = @"Distance:";
    self.connectionLabel.stringValue = @"Connections:";
    self.resultView.string = @"";
    
    self.start = [Vertex makeCoordinate:0 y:0];
    self.end = [Vertex makeCoordinate:0 y:0];
    
    NSDate *method2Finish = [NSDate date];
    NSTimeInterval executionTime = [method2Finish timeIntervalSinceDate:method2Start];
    NSLog(@"reseting time: %f", executionTime);
}

- (IBAction)draw:(id)sender {

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
    
    NSDate *method2Start = [NSDate date];
    
    [self.g dijkstra:start destination:destination];
    
    double d = 0.0;
    NSMutableArray *result = [NSMutableArray array];
    
    Vertex *vt = [self.g vertextForKey:destination];
    [result addObject:vt.key];
    
    while (vt.previous) {
        [result addObject:vt.key];
        SKShapeNode *line = [SKShapeNode node];
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, vt.coordinate.x / 12.0 - 400.0, vt.coordinate.y / 9.3 - 175.0);
        CGPathAddLineToPoint(path, nil, vt.previous.coordinate.x / 12.0 - 400.0, vt.previous.coordinate.y / 9.3 - 175.0);
        d = d + [self distance:vt.coordinate.x y:vt.coordinate.y x2:vt.previous.coordinate.x y2:vt.previous.coordinate.y];
        [line setPath:path];
        line.lineWidth = 3;
        line.strokeColor = [NSColor redColor];
        [self.skView.scene addChild:line];
        
        vt = vt.previous;
    }
    
    NSDate *method2Finish = [NSDate date];
    NSTimeInterval executionTime = [method2Finish timeIntervalSinceDate:method2Start];
    
    self.opTimeLabel.stringValue = [NSString stringWithFormat:@"Opertion Time: %f", executionTime];
    self.distanceLabel.stringValue = [NSString stringWithFormat:@"Distance: %.04f miles", d / 3.2];
    self.connectionLabel.stringValue = [NSString stringWithFormat:@"Connections: %lu", (unsigned long)result.count];
    self.resultView.string = [[result valueForKey:@"description"] componentsJoinedByString:@"\n"];
}

-(Vertex *)closest:(struct Coordinate)c{
    
    Vertex *v = [self.g vertextForKey:@"1"];
    SKNode *node = [[self.skView.scene children] objectAtIndex:10];
    float diff = [self distance:c.x y:c.y x2: node.position.x y2: node.position.y];
    
    for (SKNode *node in [self.skView.scene children]) {
        
        Vertex *vertex = [self.g vertextForKey:node.name];
        float n = [self distance:c.x y:c.y x2: node.position.x y2: node.position.y];
        if (n < diff && vertex) {
            diff = n;
            v = vertex;
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

-(float)distance:(float)x y:(float)y x2:(float)x2 y2:(float)y2{
    double dx = (x-x2);
    double dy = (y-y2);
    float dist = sqrt(dx*dx + dy*dy);
    return dist;
}

-(void)drawCities:(struct Coordinate)c withKey:(NSString *)key{
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(3, 3)];
    circle.name = key;
    circle.strokeColor = [NSColor blackColor];
    circle.fillColor = [NSColor blackColor];
    circle.position = CGPointMake(c.x / 12.0 - 400.0, c.y / 9.3 - 175.0);
    [self.skView.scene addChild:circle];
}

-(void)loadScene{
    
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
}

- (void)viewDidLoad {
    
    NSDate *method2Start = [NSDate date];

    [self loadScene];
    self.g = [[Graph alloc] init];
    [self buildGraph];
    [self draw:nil];
    
    NSDate *method2Finish = [NSDate date];
    NSTimeInterval executionTime = [method2Finish timeIntervalSinceDate:method2Start];
    NSLog(@"begining time: %f", executionTime);
    
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
