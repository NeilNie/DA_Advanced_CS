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
        self.soduku = [self constructPuzzle];
        self.stack = [[Stack alloc] init];
        self.currentMove = [self nextMove];
        self.currentMove.var = 1;
        
    }
    return self;
}

-(NSMutableArray *)constructPuzzle{
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                          [[NSMutableArray alloc] initWithObjects:@5, @3, @4, @0, @7, @8, @9, @1, @2, nil],
                          [[NSMutableArray alloc] initWithObjects:@6, @7, @2, @1, @9, @5, @0, @0, @0, nil],
                          [[NSMutableArray alloc] initWithObjects:@0, @9, @8, @0, @0, @0, @0, @6, @0, nil],
                          [[NSMutableArray alloc] initWithObjects:@8, @5, @0, @0, @6, @0, @0, @0, @3, nil],
                          [[NSMutableArray alloc] initWithObjects:@4, @0, @0, @8, @0, @3, @0, @0, @1, nil],
                          [[NSMutableArray alloc] initWithObjects:@7, @0, @0, @0, @2, @0, @8, @0, @6, nil],
                          [[NSMutableArray alloc] initWithObjects:@0, @6, @1, @5, @0, @7, @2, @8, @0, nil],
                          [[NSMutableArray alloc] initWithObjects:@2, @8, @7, @4, @1, @9, @0, @0, @5, nil],
                          [[NSMutableArray alloc] initWithObjects:@3, @4, @0, @2, @8, @6, @0, @7, @9, nil],
                          nil];
    return array;
}

-(void)solvePuzzle{
    
    while ([self nextMove]) {
        
        for (int i = (self.currentMove.var != 0)? self.currentMove.var + 1 : 1; i < 11; i++) {
            
            if (i == 10) {
                [[self.soduku objectAtIndex:self.currentMove.y] replaceObjectAtIndex:self.currentMove.x withObject:@0];
                [self.stack pop];
                self.currentMove = [self.stack peek];
                break;
            }else
                self.currentMove.var = i;
            
            if ([self validMoveTo:self.currentMove]) {
                [self.stack push:self.currentMove];
                [[self.soduku objectAtIndex:self.currentMove.y] replaceObjectAtIndex:self.currentMove.x withObject:[NSNumber numberWithInt:self.currentMove.var]];
                self.currentMove = [self nextMove];
                [self.delegate setValue];
                break;
            }
        }
    }
}

#pragma mark - Helper

-(BOOL)validMoveTo:(SKPoint *)point{
    
    return [self rowValid:point.y var:point.var] && [self columnValid:point.x var:point.var] && [self sqrValid:point];
}

-(BOOL)rowValid:(int)row var:(int)var{

    NSArray *array = [self.soduku objectAtIndex:row];
    for (int i = 0; i < array.count; i++)
        if ([[array objectAtIndex:i] intValue] == var && [[array objectAtIndex:i] intValue] != 0)
            return NO;
    
    return YES;
}

-(BOOL)columnValid:(int)column var:(int)var{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < self.soduku.count; i++) {
        [array addObject:[[self.soduku objectAtIndex:i] objectAtIndex:column]];
    }
    
    for (int  i = 0; i < array.count; i++)
        if ([[array objectAtIndex:i] intValue] == var && [[array objectAtIndex:i] intValue])
            return NO;
    
    return YES;
}

-(BOOL)sqrValid:(SKPoint *)sqr{
    
    NSArray *array = [self getSqrWithPoint:sqr];
    for (int i = 0; i < array.count; i++)
        if ([[array objectAtIndex:i] intValue] == sqr.var && [[array objectAtIndex:i] intValue] != 0)
            return NO;
    
    return YES;
}

-(SKPoint *)nextMove{
    
    SKPoint *point;
    for (int i = 0; i < self.soduku.count; i++) {
        NSMutableArray *array = [self.soduku objectAtIndex:i];
        for (int x = 0; x < array.count; x++){
            if ([[array objectAtIndex:x] intValue] == 0){
                point = [[SKPoint alloc] initWithx:x y:i var:[[[self.soduku objectAtIndex:i] objectAtIndex:x] intValue]];
                return point;
            }
        }
    }
    [self.stack print];
    return nil;
}

-(NSMutableArray *)getSqrWithPoint:(SKPoint *)point{
    
    NSMutableArray *array = [NSMutableArray array];
    
    int xf = 0, xt = 0, yf = 0, yt = 0;
    //row 1
    if (point.x <= 2 && point.y <= 2) {
        xf = 1; xt = 3; yf = 1; yt = 3;
    }else if (point.x >= 3 && point.x <= 5 && point.y <= 2){
        xf = 4; xt = 6; yf = 1; yt = 3;
    }else if (point.x >= 6 && point.x <= 8 && point.y <= 2){
        xf = 7; xt = 9; yf = 1; yt = 3;
    }
    //row 2
    else if (point.x <= 2 && point.y <= 5 && point.y >= 3) {
        xf = 1; xt = 3; yf = 4; yt = 6;
    }else if (point.x >= 3 && point.x <= 5 && point.y <= 5 && point.y >= 3){
        xf = 4; xt = 6; yf = 4; yt = 6;
    }else if (point.x >= 6 && point.x <= 8 && point.y <= 5 && point.y >= 3){
        xf = 7; xt = 9; yf = 4; yt = 6;
    }
    //row 3
    else if (point.x <= 2 && point.y <= 8 && point.y >= 6) {
        xf = 1; xt = 3; yf = 7; yt = 9;
    }else if (point.x >= 3 && point.x <= 5 && point.y <= 8 && point.y >= 6){
        xf = 4; xt = 6; yf = 7; yt = 9;
    }else if (point.x >= 6 && point.x <= 8 && point.y <= 8 && point.y >= 6){
        xf = 7; xt = 9; yf = 7; yt = 9;
    }
    
    for (int y = yf; y < yt + 1; y++)
        for (int x = xf; x < xt + 1; x++)
            [array addObject:[[self.soduku objectAtIndex:y - 1] objectAtIndex:x - 1]];

    return array;
}

@end
