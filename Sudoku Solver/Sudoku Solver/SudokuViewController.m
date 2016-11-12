//
//  ViewController.m
//  Sudoku Solver
//
//  Created by Yongyang Nie on 11/4/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "SudokuViewController.h"

@implementation SudokuViewController

-(void)setValue{
    
    for (int i = 0; i < self.sudoku.soduku.count; i++) {
        switch (i) {
            case 0:
                self.row1.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 1:
                self.row2.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 2:
                self.row3.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 3:
                self.row4.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 4:
                self.row5.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 5:
                self.row6.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 6:
                self.row7.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 7:
                self.row8.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
            case 8:
                self.row9.stringValue = [[[self.sudoku.soduku objectAtIndex:i] description] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                break;
                
            default:
                break;
        }
    }
}

-(IBAction)solve:(id)sender{
    [self.sudoku solvePuzzle];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sudoku = [[Sudoku alloc] init];
    self.sudoku.delegate = self;
    [self setValue];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
