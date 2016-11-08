//
//  Soduku.h
//  Maze
//
//  Created by Yongyang Nie on 11/7/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "Stack.h"

//struct for x,y point/
struct SKPoint {
    int x;
    int y;
};

typedef enum SKObjectType {
    SKObject = 0,
} SKObjectType;

@interface Sudoku : NSObject


/**Properties**/

@property (strong, nonatomic) id delegate;

//soduku data, which is a matrix containing numbers
@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *soduku;

@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *sodukuSolution;

//stack used for depth first search
@property (strong, nonatomic) Stack *stack;


/**Methods**/

-(instancetype)init;

-(void)solvePuzzle;

-(BOOL)rowValid:(int)row;

@end

@protocol MazeDelegate <NSObject>

-(void)drawObjectAt:(struct SKPoint)point objectType:(SKObjectType)objectType;

@end
