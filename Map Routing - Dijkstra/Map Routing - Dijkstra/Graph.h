//
//  Graph.h
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"
#import "PQ.h"

@interface Graph : NSObject

-(instancetype)initWithObjects:(NSArray *)objects;

-(instancetype)init;

@property (nonatomic, strong) NSMutableDictionary *adjacencyList;

@property (nonatomic) NSUInteger count;

//adds an instance of Vertex to the graph.
-(void)addVertex:(Vertex *)vertex;

//Adds a new, weighted, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to weight:(int)weight;

//finds the vertex in the graph named vertKey.
-(NSMutableArray *)getConnections:(NSString *)key;

-(Vertex *)vertextForKey:(NSString *)key;

-(void)dijkstra:(NSString *)source destination:(NSString *)destination;

-(void)print;

@end
