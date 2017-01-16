//
//  Graph.h
//  Word Ladder
//
//  Created by Yongyang Nie on 1/11/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"

@interface Graph : NSObject

@property (nonatomic, strong) NSMutableDictionary *adjacencyList;

@property (nonatomic) NSUInteger count;

//adds an instance of Vertex to the graph.
-(void)addVertex:(NSString *)key;

//Adds a new, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to;

//Adds a new, weighted, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to weight:(int)weight;

//finds the vertex in the graph named vertKey.
-(NSMutableArray *)getConnections:(NSString *)key;

-(Vertex *)getVertex:(NSString *)key;

@end
