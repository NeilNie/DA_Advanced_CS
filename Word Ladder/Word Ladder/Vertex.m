//
//  Vertex.m
//  Word Ladder
//
//  Created by Yongyang Nie on 1/15/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

- (instancetype)initWithKey:(NSString *)key
{
    self = [super init];
    if (self) {
        self.connections = [NSMutableArray array];
        self.predecessor = [[Vertex alloc] init];
        self.key = key;
        self.state = StateUndiscovered;
        self.distance = 0;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"key: %@ \n connections: %@", self.key, [self.connections description]];
    //return [NSString stringWithFormat:@"key: %@", self.key];
}

@end
