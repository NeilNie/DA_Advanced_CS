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
    
    self.moves = [[LinkedList alloc] init];
    
    if (mode == MZSolveModeDepth) {
        self.stack = [[Stack alloc] init];
    }else{
        self.queue = [[Queue alloc] init];
    }
}

-(void)solveMaze{
    
    while(![self isSolved]) {
        
    }
}

#pragma mark - Helper

-(NSString *)charAt:(struct MZPoint)point{
    
    NSArray *array = [self.maze objectAtIndex:point.y];
    return (NSString *)[array objectAtIndex:point.x];
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
    
    for (int i = 0; self.maze.count; i++) {
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
