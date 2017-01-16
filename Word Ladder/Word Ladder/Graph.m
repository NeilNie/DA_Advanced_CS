//
//  Graph.m
//  Word Ladder
//
//  Created by Yongyang Nie on 1/11/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Graph.h"

@implementation Graph

#pragma mark - Constructors

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.adjacencyList = [[NSMutableDictionary alloc] init];
        self.count = 0;
    }
    return self;
}

#pragma mark - Instance Methods

-(void)addVertex:(NSString *)key withObjects:(NSMutableArray *)objects{
    
    self.count+=1;
    Vertex *v = [[Vertex alloc] initWithKey:key];
    v.connections = objects;
    [self.adjacencyList setObject:v forKey:key];
}

//adds an instance of Vertex to the graph.
-(void)addVertex:(NSString *)key{
    
    self.count+=1;
    if (![self getVertex:key]) {
        Vertex *v = [[Vertex alloc] initWithKey:key];
        [self.adjacencyList setObject:v forKey:key];
    }
}

//Adds a new, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to{
    
    Vertex *f = [self getVertex:from];
    if (f) {
        [f.connections addObject:to];
    }else
        [self addVertex:from withObjects:[NSMutableArray arrayWithObjects:to, nil]];
    
    Vertex *t = [self getVertex:to];
    if (t) {
        [t.connections addObject:from];
    }else
        [self addVertex:to withObjects:[NSMutableArray arrayWithObjects:from, nil]];
}

//Adds a new, weighted, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to weight:(int)weight{
    
}

-(Vertex *)getVertex:(NSString *)key{
    
    return [self.adjacencyList objectForKey:key];
}

//finds the vertex in the graph named vertKey.
-(NSMutableArray *)getConnections:(NSString *)key{
    
    return [(Vertex *)[self.adjacencyList objectForKey:key] connections];
}

#pragma mark - Override

-(NSString *)description{
    return [self.adjacencyList description];
}

@end
