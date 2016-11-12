//
//  SKPoint.m
//  Sudoku Solver
//
//  Created by Yongyang Nie on 11/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "SKPoint.h"

@implementation SKPoint

- (instancetype)initWithx:(int)x y:(int)y var:(int)var
{
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
        self.var = var;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"\n x: %i \n y: %i \n value: %i \n", self.x, self.y, self.var];
}

@end
