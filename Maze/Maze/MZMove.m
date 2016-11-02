//
//  MZMove.m
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "MZMove.h"

@implementation MZMove

- (instancetype)initWithPoint:(int)x y:(int)y parent:(MZMove *)move inDirection:(int)direction
{
    self = [super init];
    if (self) {
        self.direction = direction;
        self.x = x;
        self.y = y;
        self.parent = move;
    }
    return self;
}

#pragma mark - Override

-(NSString *)description{
    return [NSString stringWithFormat:@"move: %i, %i \n direction: %i", self.x, self.y, self.direction];
}

@end
