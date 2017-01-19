//
//  Vertex.h
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <limits.h>

struct Coordinate{
    float x;
    float y;
} Coordinate;

@interface Vertex : NSObject

@property (nonatomic) int cost;
@property struct Coordinate coordinate;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) Vertex *previous;
@property (strong, nonatomic) NSMutableDictionary *connections;

- (instancetype)initWithKey:(NSString *)key cost:(int)cost coordinate:(struct Coordinate)coordinate;

+(struct Coordinate)makeCoordinate:(int)x y:(int)y;

@end
