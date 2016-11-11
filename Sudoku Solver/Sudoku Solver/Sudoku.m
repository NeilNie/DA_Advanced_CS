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
                        @[@6, @7, @2, @1, @9, @5, @0, @0, @0],
                        @[@0, @9, @8, @0, @0, @0, @0, @6, @0],
                        @[@8, @0, @0, @0, @6, @0, @0, @0, @3],
                        @[@4, @0, @0, @8, @0, @3, @0, @0, @1],
                        @[@7, @0, @0, @0, @2, @0, @0, @0, @6],
                        @[@0, @6, @0, @0, @0, @0, @2, @8, @0],
                        @[@0, @0, @0, @4, @1, @9, @0, @0, @5],
                        @[@0, @0, @0, @1, @8, @1, @0, @7, @9],
                        ];
        self.stack = [[Stack alloc] init];
        self.currentMove = [self nextMove];
    }
    return self;
}

-(void)solvePuzzle{
    
    while (![self solved]) {
        
        SKPoint *move = [self nextMove];
        
        for (int i = 1; i < 10; i++) {
            
            if (i >= 10) {
                [self.stack pop];
                SKPoint *point = [self.stack peek];
                point.var ++;
                break;
            }else
                move.var = i;
            
            if ([self validMoveTo:move]) {
                [self.stack push:move];
                NSLog(@"%@", move);
                break;
            }
        }
    }
    
}

#pragma mark - Helper

-(BOOL)validMoveTo:(SKPoint *)point{
    
    return [self rowValid:point.y] && [self columnValid:point.x] && [self sqrValid:point];
}

-(BOOL)rowValid:(int)row{

    NSArray *array = [self.soduku objectAtIndex:row];
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(BOOL)columnValid:(int)column{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < self.soduku.count; i++) {
        [array addObject:[[self.soduku objectAtIndex:i] objectAtIndex:column]];
    }
    
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(BOOL)sqrValid:(SKPoint *)sqr{
    
    NSArray *array = [self getSqrWithPoint:sqr];
    for (int i = 0; i < array.count; i++)
        for (int j = i + 1; j < array.count; j++)
            if (array[i] == array[j] && ([[array objectAtIndex:j] intValue] != 0 && [[array objectAtIndex:i] intValue] != 0))
                return NO;
    return YES;
}

-(BOOL)solved{
    
    for (int i = 0; i < self.soduku.count; i++) {
        NSMutableArray *array = [self.soduku objectAtIndex:i];
        for (int x = 0; x < array.count; x++)
            if ([[array objectAtIndex:x] intValue] == 0)
                return NO;
    }
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
    @throw [NSException exceptionWithName:@"Invalid return value" reason:@"There is no next move" userInfo:nil];
}

-(NSMutableArray *)getSqrWithPoint:(SKPoint *)point{
    
    NSMutableArray *array = [NSMutableArray array];
    
    int xf = 0, xt = 0, yf = 0, yt = 0;
    //row 1
    if (point.x <= 3 && point.y <= 3) {
        xf = 1; xt = 3; yf = 1; yt = 3;
    }else if (point.x >= 4 && point.x <= 6 && point.y <= 3){
        xf = 4; xt = 6; yf = 1; yt = 3;
    }else if (point.x >= 7 && point.x <= 9 && point.y <= 3){
        xf = 7; xt = 9; yf = 1; yt = 3;
    }
    //row 2
    else if (point.x <= 3 && point.y <= 6 && point.y >= 4) {
        xf = 1; xt = 3; yf = 4; yt = 6;
    }else if (point.x >= 4 && point.x <= 6 && point.y <= 6 && point.y >= 4){
        xf = 4; xt = 6; yf = 4; yt = 6;
    }else if (point.x >= 7 && point.x <= 9 && point.y <= 6 && point.y >= 4){
        xf = 7; xt = 9; yf = 4; yt = 6;
    }
    //row 3
    else if (point.x <= 3 && point.y <= 6 && point.y >= 4) {
        xf = 1; xt = 3; yf = 7; yt = 9;
    }else if (point.x >= 4 && point.x <= 6 && point.y <= 6 && point.y >= 4){
        xf = 4; xt = 6; yf = 7; yt = 9;
    }else if (point.x >= 7 && point.x <= 9 && point.y <= 6 && point.y >= 4){
        xf = 7; xt = 9; yf = 7; yt = 9;
    }
    
    for (int y = yf; y < yt + 1; y++)
        for (int x = xf; x < xt + 1; x++)
            [array addObject:[[self.soduku objectAtIndex:y - 1] objectAtIndex:x - 1]];

    return array;
}

@end
