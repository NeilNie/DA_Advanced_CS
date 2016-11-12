//
//  SudokuViewController.h
//  Sudoku Solver
//
//  Created by Yongyang Nie on 11/4/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Sudoku.h"

@interface SudokuViewController : NSViewController <SudokuDelegate>

@property (strong) Sudoku *sudoku;

@property (weak) IBOutlet NSTextField *row1;
@property (weak) IBOutlet NSTextField *row2;
@property (weak) IBOutlet NSTextField *row3;
@property (weak) IBOutlet NSTextField *row4;
@property (weak) IBOutlet NSTextField *row5;
@property (weak) IBOutlet NSTextField *row6;
@property (weak) IBOutlet NSTextField *row7;
@property (weak) IBOutlet NSTextField *row8;
@property (weak) IBOutlet NSTextField *row9;

@end

