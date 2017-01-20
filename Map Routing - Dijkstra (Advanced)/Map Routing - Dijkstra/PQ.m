//
//  PQ.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "PQ.h"

@interface PQ ()

@property (strong, nonatomic) Heap *heap;

@end

@implementation PQ

#pragma mark - Constructors

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.heap = [[Heap alloc] init];
    }
    return self;
}

-(instancetype)initWithObjects:(NSArray *)objects{
    
    self = [super self];
    if (self){
        self.heap = [[Heap alloc] initWithObjects:objects];
    }
    return self;
}

#pragma mark - Instance Methods

-(void)print{
    [self.heap print];
}

-(int)count{
    return (int)[self.heap count];
}

-(BOOL)isEmpty{
    return [self.heap isEmpty];
}

-(Vertex *)peek{
    return [self.heap peek];
}

-(void)enqueue:(Vertex *)x{
    [self.heap insert:x];
}

-(Vertex *)dequeue{
    return [self.heap remove];
}

-(void)changePriority:(NSString *)key toValue:(Vertex *)value{
    [self.heap replace:key withValue:value];
}

-(NSString *)description{
    return [self.heap valueForKey:@"description"];
}

@end
