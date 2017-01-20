//
//  Graph.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Graph.h"

@implementation Graph

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.adjacencyList = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray *)array
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
    
-(Vertex *)vertextForKey:(NSString *)key{
    return [self.adjacencyList objectForKey:key];
}

//adds an instance of Vertex to the graph.
-(void)addVertex:(Vertex *)vertex{
    [self.adjacencyList setObject:vertex forKey:vertex.key];
}

//Adds a new, weighted, directed edge to the graph that connects two vertices.
-(void)addEdge:(NSString *)from toVert:(NSString *)to weight:(int)weight{
    
    Vertex *f = [self.adjacencyList objectForKey:from];
    if (f) {
        [f.connections setObject:[NSNumber numberWithInt:weight] forKey:to];
    }else{
        f.connections = [NSMutableDictionary dictionary];
        [f.connections setObject:[NSNumber numberWithInt:weight] forKey:to];
    }
    
    Vertex *t = [self.adjacencyList objectForKey:to];
    if (t) {
        [t.connections setObject:[NSNumber numberWithInt:weight] forKey:from];
    }else{
        t.connections = [NSMutableDictionary dictionary];
        [t.connections setObject:[NSNumber numberWithInt:weight] forKey:from];
    }
    
}

//finds the vertex in the graph named vertKey.
-(NSMutableDictionary *)getConnections:(NSString *)key{
    return [(Vertex *)[self.adjacencyList objectForKey:key] connections];
}

/*
 
 1  function Dijkstra(Graph, source):
 2      dist[source] ← 0                         // Initialization
 3
 4      create vertex set Q
 5
 6      for each vertex v in Graph:
 7          if v ≠ source
 8              dist[v] ← INFINITY               // Unknown distance from source to v
 9              prev[v] ← UNDEFINED              // Predecessor of v
 10
 11         Q.add_with_priority(v, dist[v])
 12
 13
 14     while Q is not empty:                    // The main loop
 15         u ← Q.extract_min()                  // Remove and return best vertex
 16         for each neighbor v of u:            // only v that is still in Q
 17             alt = dist[u] + length(u, v)
 18             if alt < dist[v]
 19                 dist[v] ← alt
 20                 prev[v] ← u
 21                 Q.decrease_priority(v, alt)
 22
 23     return dist[], prev[]
 
 */

-(void)dijkstra:(NSString *)source destination:(NSString *)destination{
    
    PQ *pq = [[PQ alloc] init];
    
    Vertex *s = [self.adjacencyList objectForKey:source];
    s.cost = 0;
    for (NSString *key in [s.connections allKeys]) {
        Vertex *v = [self vertextForKey:key];
        v.cost = [[s.connections objectForKey:key] intValue];
        v.previous = s;
        [pq enqueue:v];
    }
    
    while (![pq isEmpty]) {
        
        Vertex *v = [pq dequeue];
        for (NSString *key in [v.connections allKeys]) {
            Vertex *vertex = [self vertextForKey:key];
            if (vertex.cost >  v.cost + [[v.connections objectForKey:key] intValue]){
                vertex.cost = v.cost + [[v.connections objectForKey:key] intValue];
                vertex.previous = v;
                [pq enqueue:vertex];
            }
        }
    }
}

-(void)print{
    NSLog(@"%@", self.adjacencyList);
}

-(NSString *)description{
    return [self.adjacencyList description];
}

@end
