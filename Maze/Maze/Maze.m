//
//  Maze.m
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Maze.h"

@implementation Maze

#pragma mark - Constructors

-(instancetype)initWithText:(NSString *)string rowLength:(int)length{
    
    self = [super init];
    if (self) {
        self.queue = [[Queue alloc] init];
        self.stack = [[Stack alloc] init];
        self.maze = [Maze convertTextToMaze:string rowLength:length];
        self.start = [self findStart];
        self.end = [self findEnd];
        self.current = self.start;
        self.moves = [[LinkedList alloc] init];
        self.currentMove = [[MZMove alloc] initWithPoint:self.start.x y:self.start.y parent:nil inDirection:0];
    }
    return self;
}

-(instancetype)initWithFile:(NSArray *)array{
    
    self = [super init];
    if (self) {
        [self convertArrayToMatrix:array];
        self.queue = [[Queue alloc] init];
        self.stack = [[Stack alloc] init];
        self.start = [self findStart];
        self.end = [self findEnd];
        self.current = self.start;
        self.moves = [[LinkedList alloc] init];
        self.currentMove = [[MZMove alloc] initWithPoint:self.start.x y:self.start.y parent:nil inDirection:0];
        
    }
    return self;
}

#pragma mark - Methods

-(void)mazeBegin:(MZSolveMode)mode{
    
    if (mode == MZSolveModeDepth) {
        while (![self isSolved]) {
            [self DepthSolveMaze];
        }
    }else{
        [self.queue enqueue:self.currentMove];
        while (![self isSolved]) {
            [self BreadthSolveMaze];
        }
    }
}

-(void)BreadthSolveMaze{
    
    while (![self.queue isEmpty]) {
        
        MZMove *move = [self.queue dequeue];
        
        struct MZPoint point = [self makePointx:move.x y:move.y];
        
        for (int i = 0; i < 4; i++) {
            
            switch (i) {
                case 0:
                    point = [self makePointx:move.x y:move.y + 1]; break;
                case 1:
                    point = [self makePointx:move.x + 1 y:move.y]; break;
                case 2:
                    point = [self makePointx:move.x y:move.y - 1]; break;
                case 3:
                    point = [self makePointx:move.x - 1 y:move.y]; break;
                    
                default:
                    break;
            }
            if ([self canMoveTo:point]) {
                //create move object
                MZMove *move = [[MZMove alloc] initWithPoint:point.x y:point.y parent:self.currentMove inDirection:i];
                
                //put * at the valid move
                [[self.maze objectAtIndex:self.current.y] replaceObjectAtIndex:self.current.x withObject:@"*"];
                
                //push it to the queue
                [self.queue enqueue:move];
                
                [self.moves addObject:move];
                
                //update current and current move
                self.current = point;
                self.currentMove = move;
            }
        }
    }
}

-(void)DepthSolveMaze{
    
    struct MZPoint point = self.current;
    
    for (int i = 0; i < 5; i++) {
        
        switch (i) {
            case 0:
                point = [self makePointx:self.current.x y:self.current.y + 1]; break;
            case 1:
                point = [self makePointx:self.current.x + 1 y:self.current.y]; break;
            case 2:
                point = [self makePointx:self.current.x y:self.current.y - 1]; break;
            case 3:
                point = [self makePointx:self.current.x - 1 y:self.current.y]; break;
            case 4:
                //replace invalid move with wall
                [[self.maze objectAtIndex:[(MZMove *)[self.stack peek] y]] replaceObjectAtIndex:[(MZMove *)[self.stack peek] x] withObject:@"*"];
                
                //pop invalid move
                [self.stack pop];
                self.currentMove = [self.stack peek];
                self.current = [self makePointx:self.currentMove.x y:self.currentMove.y];
                break;
                
            default: break;
        }
        if ([self canMoveTo:point]) {
            //create move object
            MZMove *move = [[MZMove alloc] initWithPoint:point.x y:point.y parent:self.currentMove inDirection:i];
            
            //put * at the valid move
            [[self.maze objectAtIndex:self.current.y] replaceObjectAtIndex:self.current.x withObject:@"*"];
            
            //push it to the stack
            [self.stack push:move];
            
            //update current and current move
            self.current = point;
            self.currentMove = move;
        }
    }
}

#pragma mark - Helper

+(NSMutableArray <NSMutableArray *> *)convertTextToMaze:(NSString *)maze rowLength:(int)length{
    
    NSMutableArray *array = [NSMutableArray array];
    int nRows = (int)[maze length] / length;
    
    for (int i = 0; i < nRows; i++){
        
        NSMutableArray *row = [NSMutableArray array];
        for (int x = 0; x < length; x++) {
            NSString *chr = [NSString stringWithFormat:@"%c", [maze characterAtIndex:i * length + x]];
            [row addObject:chr];
        }
        [array addObject:row];
    }
    return array;
}

#pragma mark - Private

-(void)convertArrayToMatrix:(NSArray *)array{
    
    NSMutableArray *mat = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int x = 0; x < [(NSString *)[array objectAtIndex:i] length]; x++) {
            NSString *chr = [NSString stringWithFormat:@"%c", [(NSString *)[array objectAtIndex:i] characterAtIndex:x]];
            [row addObject:chr];
        }
        [mat addObject:row];
    }
    self.maze = mat;
}

-(NSString *)charAt:(struct MZPoint)point{  return (NSString *)[[self.maze objectAtIndex:point.y] objectAtIndex:point.x];   }

-(BOOL)canMoveTo:(struct MZPoint)point{     return [[self charAt:[self makePointx:point.x y:point.y]] isEqualToString:@"."];}

-(BOOL)isSolved{
    
    return
    [[self charAt:[self makePointx:self.current.x + 1 y:self.current.y]] isEqualToString:@"E"] ||
    [[self charAt:[self makePointx:self.current.x - 1 y:self.current.y]] isEqualToString:@"E"] ||
    [[self charAt:[self makePointx:self.current.x y:self.current.y + 1]] isEqualToString:@"E"] ||
    [[self charAt:[self makePointx:self.current.x y:self.current.y - 1]] isEqualToString:@"E"];
}

-(struct MZPoint)findStart{
    
    for (int i = 0; self.maze.count; i++) {
        NSArray *array = [self.maze objectAtIndex:i];
        for (int x = 0; x < array.count; x++) {
            if ([[array objectAtIndex:x] isEqualToString:@"S"]) {
                return [self makePointx:x y:i];
            }
        }
    }
    @throw [NSException exceptionWithName:@"Invalid maze" reason:@"Invalid maze: there is no start" userInfo:nil];
}

-(struct MZPoint)findEnd{
    
    for (int i = 0; i < self.maze.count; i++) {
        NSArray *array = [self.maze objectAtIndex:i];
        for (int x = 0; x < array.count; x++) {
            if ([[array objectAtIndex:x] isEqualToString:@"E"]) {
                return [self makePointx:x y:i];
            }
        }
    }
    @throw [NSException exceptionWithName:@"Invalid maze" reason:@"Invalid maze: there is no end" userInfo:nil];
}

-(struct MZPoint)makePointx:(int)x y:(int)y{
    struct MZPoint point;
    point.x = x;
    point.y = y;
    return point;
}

@end
