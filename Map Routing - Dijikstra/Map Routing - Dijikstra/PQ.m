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

-(instancetype)initWithObjects:(NSArray *)objects{
    self = [super self];
    if (self){
        self.heap = [[Heap alloc] initWithObjects:objects];
    }
    return self;
}

-(NSUInteger)count{
    return [self.heap count];
}

-(BOOL)isEmpty{
    return [self.heap isEmpty];
}

-(int)peek{
    return [self.heap peek];
}

-(void)enqueuenum:(int)x{
    [self.heap insert:x];
}

-(int)dequeuenum{
    return [self.heap remove];
}

-(void)changePriority:(int)index toValue:(int)value{
    [self.heap replace:index withValue:value];
}

@end
