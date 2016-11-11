//
//  ViewController.m
//  Sudoku Solver
//
//  Created by Yongyang Nie on 11/4/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Sudoku *soduku = [[Sudoku alloc] init];
    //[soduku solvePuzzle];
    NSLog(@"%i", [soduku rowValid:1]);
    NSLog(@"%@", [soduku getSqrWithPoint:[[SKPoint alloc] initWithx:3 y:2 var:1]]);
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
