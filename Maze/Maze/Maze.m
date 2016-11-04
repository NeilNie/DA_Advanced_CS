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

- (instancetype)init{
    
    self = [super init];
    return self;
}

-(instancetype)initWithText:(NSString *)string rowLength:(int)length{
    
    self = [super init];
    if (self) {
        self.maze = [Maze convertTextToMaze:string rowLength:length];
    }
    return self;
}

#pragma mark - Methods

-(void)mazeBegin:(MZSolveMode)mode{
    
    self.start = [self findStart];
    self.end = [self findEnd];
    self.current = self.start;
    self.moves = [[LinkedList alloc] init];
    self.currentMove = [[MZMove alloc] initWithPoint:self.start.x y:self.start.y parent:nil inDirection:0];
    
    if (mode == MZSolveModeDepth) {
        self.stack = [[Stack alloc] init];
    }else{
        self.queue = [[Queue alloc] init];
        [self.queue enqueue:self.currentMove];
    }
}

-(void)BreadthSolveMaze{
    
    while (![self isSolved]) {
        
        while (![self.queue isEmpty]) {
            
            MZMove *move = [self.queue dequeue];
            
            struct MZPoint point = [self makePointx:move.x y:move.y];
            
            for (int i = 0; i < 4; i++) {
                
                switch (i) {
                    case 0:
                        point = [self makePointx:move.x y:move.y + 1];
                        break;
                    case 1:
                        point = [self makePointx:move.x + 1 y:move.y];
                        break;
                    case 2:
                        point = [self makePointx:move.x y:move.y - 1];
                        break;
                    case 3:
                        point = [self makePointx:move.x - 1 y:move.y];
                        break;
                        
                    default:
                        break;
                }
                if ([self canMoveTo:point]) {
                    //create move object
                    MZMove *move = [[MZMove alloc] initWithPoint:point.x y:point.y parent:self.currentMove inDirection:i];
                    
                    //put * at the valid move
                    [self replaceCharAt:self.current withString:@"*"];
                    
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
}

-(void)DepthSolveMaze{
    
    while(![self isSolved]) {
        
        struct MZPoint point = self.current;
    
        for (int i = 0; i < 5; i++) {
            
            switch (i) {
                case 0:
                    point = [self makePointx:self.current.x y:self.current.y + 1];
                    break;
                case 1:
                    point = [self makePointx:self.current.x + 1 y:self.current.y];
                    break;
                case 2:
                    point = [self makePointx:self.current.x y:self.current.y - 1];
                    break;
                case 3:
                    point = [self makePointx:self.current.x - 1 y:self.current.y];
                    break;
                case 4:
                    //replace invalid move with wall
                    [self replaceCharAt:[self makePointx:[(MZMove *)[self.stack peek] x] y:[(MZMove *)[self.stack peek] y]] withString:@"@"];
                    //pop invalid move
                    [self.stack pop];
                    self.currentMove = [self.stack peek];
                    self.current = [self makePointx:self.currentMove.x y:self.currentMove.y];
                    break;
                    
                default:
                    break;
            }
            if ([self canMoveTo:point]) {
                //create move object
                MZMove *move = [[MZMove alloc] initWithPoint:point.x y:point.y parent:self.currentMove inDirection:i];
                //put * at the valid move
                [self replaceCharAt:self.current withString:@"*"];
                //push it to the stack
                [self.stack push:move];
                //update current and current move
                self.current = point;
                self.currentMove = move;
                break;
            }
        }
    }
}

#pragma mark - Helper

-(NSString *)charAt:(struct MZPoint)point{
    return (NSString *)[[self.maze objectAtIndex:point.y] objectAtIndex:point.x];
}

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

-(void)replaceCharAt:(struct MZPoint)point withString:(NSString *)string{
    [[self.maze objectAtIndex:point.y] replaceObjectAtIndex:point.x withObject:string];
}

-(BOOL)canMoveTo:(struct MZPoint)point{
    
    return
    [[self charAt:[self makePointx:point.x y:point.y]] isEqualToString:@"."];
}

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
