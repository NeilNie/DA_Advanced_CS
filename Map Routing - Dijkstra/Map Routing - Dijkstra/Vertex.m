//
//  Vertex.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

- (instancetype)initWithKey:(NSString *)key cost:(int)cost coordinate:(struct Coordinate)coordinate
{
    self = [super init];
    if (self) {
        self.connections = [[NSMutableDictionary alloc] init];
        self.coordinate = coordinate;
        self.cost = cost;
        self.key = key;
        self.previous = nil;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.connections = [[NSMutableDictionary alloc] init];
        self.cost = INT_MAX;
    }
    return self;
}

+(struct Coordinate)makeCoordinate:(float)x y:(float)y{
    struct Coordinate c;
    c.x = x;
    c.y = y;
    return c;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"key:%@ \n connects: %@", self.key, [self.connections description]];
}

@end
