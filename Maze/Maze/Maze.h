//
//  Maze.h
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "Queue.h"
#import "Stack.h"
#import "MZMove.h"

typedef enum MZSolveMode {
    MZSolveModeBreadth = 0,
    MZSolveModeDepth
} MZSolveMode;

typedef enum MZObjectType {
    MZObjectWall = 0,
    MZObjectTrace,
    MZObjectInvalidMove,
    MZObjectStart,
    MZObjectTypeEnd
} MZObjectType;

//struct for x,y point/
struct MZPoint {
    int x;
    int y;
};

@interface Maze : NSObject

/**Properties**/

@property (strong, nonatomic) id delegate;

//maze data, which is array of arrays containing char (NSString *)
@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *maze;

//the beginning of the maze
@property struct MZPoint start;

//the end of the maze
@property struct MZPoint end;

//the current position of the maze. Used for solving the maze
@property struct MZPoint current;

@property (strong, nonatomic) MZMove *currentMove;

//linked list containing all the moves.
@property (strong, nonatomic) LinkedList *moves;

//queue used for breadth first search
@property (strong, nonatomic) Queue *queue;

//stack used for depth first search
@property (strong, nonatomic) Stack *stack;

/**Methods**/

-(instancetype)initWithText:(NSString *)string rowLength:(int)length;

//convert text to matrix
+(NSMutableArray <NSMutableArray *> *)convertTextToMaze:(NSString *)maze rowLength:(int)length;

//solve maze with depth first search
-(void)DepthSolveMaze;

//solve maze with breadth first search
-(void)BreadthSolveMaze;

//setup the maze for solving the maze.
-(void)mazeBegin:(MZSolveMode)mode;

-(void)convertArrayToMatrix:(NSArray *)array;

@end

@protocol MazeDelegate <NSObject>

-(void)drawObjectAt:(struct MZPoint)point objectType:(MZObjectType)objectType;

@end
