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

//adds an instance of Vertex to the graph.
-(void)addVertex:(NSString *)key{
    
    self.count+=1;
    [self.adjacencyList setObject:[[NSMutableArray alloc] init] forKey:key];
}

//Adds a new, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to{
    
    NSMutableArray *fromArray = [self.adjacencyList objectForKey:from];
    [fromArray addObject:to];
    [self.adjacencyList setObject:fromArray forKey:from];
    
    NSMutableArray *toArray = [self.adjacencyList objectForKey:to];
    [toArray addObject:from];
    [self.adjacencyList setObject:toArray forKey:to];
}

//Adds a new, weighted, directed edge to the graph that connects two vertices.
-(void)addEdge:(Vertex *)from toVert:(Vertex *)to weight:(int)weight{
    
}

//finds the vertex in the graph named vertKey.
-(NSMutableArray *)getConnections:(NSString *)key{
    
    return [self.adjacencyList objectForKey:key];
}

-(BOOL)contains:(NSString *)key{
    return [self.adjacencyList objectForKey:key] ? YES : NO;
}

@end
