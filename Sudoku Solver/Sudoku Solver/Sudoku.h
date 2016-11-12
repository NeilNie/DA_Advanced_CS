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
#import "SKPoint.h"

typedef enum SKObjectType {
    SKObject = 0,
} SKObjectType;

@interface Sudoku : NSObject


/**Properties**/

@property (strong, nonatomic) id delegate;

//soduku data, which is a matrix containing numbers
@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *soduku;

@property (strong, nonatomic) NSMutableArray <NSMutableArray *> *sodukuSolution;

@property (strong, nonatomic) SKPoint *currentMove;

//stack used for depth first search
@property (strong, nonatomic) Stack *stack;


/**Methods**/

-(instancetype)init;

-(void)solvePuzzle;

-(BOOL)rowValid:(int)row var:(int)var;

-(BOOL)columnValid:(int)column var:(int)var;

-(NSMutableArray *)getSqrWithPoint:(SKPoint *)point;

@end

@protocol SudokuDelegate <NSObject>

-(void)setValue;

@end
