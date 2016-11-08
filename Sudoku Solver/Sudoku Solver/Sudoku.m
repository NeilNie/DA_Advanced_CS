//
//  Soduku.m
//  Maze
//
//  Created by Yongyang Nie on 11/7/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Sudoku.h"

@implementation Sudoku

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.soduku = [NSMutableArray array];
        self.soduku = (NSMutableArray *)@[
                        @[@5, @3, @4, @6, @7, @8, @9, @1, @2],
                        @[@6, @0, @0, @1, @9, @5, @0, @0, @0],
                        @[@0, @9, @8, @0, @0, @0, @0, @6, @0],
                        @[@8, @0, @0, @0, @6, @0, @0, @0, @3],
                        @[@4, @0, @0, @8, @0, @3, @0, @0, @1],
                        @[@7, @0, @0, @0, @2, @0, @0, @0, @6],
                        @[@0, @6, @0, @0, @0, @0, @2, @8, @0],
                        @[@0, @0, @0, @4, @1, @9, @0, @0, @5],
                        @[@0, @0, @0, @1, @8, @1, @0, @7, @9],
                        ];
        NSLog(@"%@", self.soduku);
        self.stack = [[Stack alloc] init];
    }
    return self;
}

-(void)solvePuzzle{
    
    
}

#pragma mark - Helper

-(BOOL)rowValid:(int)row{

    NSArray *array = [self.soduku objectAtIndex:row];
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(BOOL)columnValid:(int)column{
    
    NSArray *array = [self.soduku objectAtIndex:column];
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(BOOL)sqrValid:(int)sqr{
    
    NSArray *array = [self getSqr:sqr];
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(NSMutableArray *)getSqr:(int)i{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 3 * sqr; i < i + 4; i++) {
        
    }
    return array;
}

-(BOOL)validMoveRow:(int)row column:(int)column sqr:(int)sqr{
    
    return [self rowValid:row] || [self columnValid:column] || [self sqrValid:sqr];
}

-(struct SKPoint)makePointx:(int)x y:(int)y{
    struct SKPoint point;
    point.x = x;
    point.y = y;
    return point;
}

@end
