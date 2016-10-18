//
//  ViewController.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 9/28/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)calculateGCD:(id)sender{
    
    int gcd = [GCD GCDof:[self.textInput1.text intValue] and:[self.textInput2.text intValue]];
    self.result.text = [NSString stringWithFormat:@"The greatest common denominator %i", gcd];
}
-(IBAction)calculateBinary:(id)sender{

    self.binary.binary = @"";
    [self.binary PrintInBinary:[self.textInput1.text intValue]];
    self.result.text = self.binary.binary;
}
-(IBAction)calculateDSum:(id)sender{
    
    int sum = [DigitSum numberOfDigit:[self.textInput1.text intValue]];
    self.result.text = [NSString stringWithFormat:@"The sum of the digits is %i", sum];
}
- (IBAction)puzzleExample:(id)sender {
    
    self.textInput1.text = @"3,6,4,1,3,4,2,5,3,0";
}
-(IBAction)calculatePuzzle:(id)sender{
    
    NSArray *array = [self convertStringToArray:self.textInput1.text];
    BOOL solvable = [self.puzzle puzzle:array IsSolveableIfStartingAt:0];
    NSString *string = (solvable)? @"Solvable": @"Can't be solved";
    self.result.text = string;
}
-(IBAction)startHanoi:(id)sender{
    
    NYStack *stack1 = [[NYStack alloc] initWithArray:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil]];
    NYStack *stack2 = [[NYStack alloc] init];
    NYStack *stack3 = [[NYStack alloc] init];
    
    self.hanoiData = [NSMutableArray arrayWithObjects:stack1, stack2, stack3, nil];
    [self.hanoi Hanoi:3 source:1 destination:3 temp:2];
}
-(IBAction)startDrawing:(id)sender{
    
    [self.drawing drawCircle:100 withX:180 withY:300];
}
-(IBAction)startDrawingTree:(id)sender{
    
    [self.drawing drawTreeStart:CGPointMake(180, 600) length:150 angle:90];
}
-(IBAction)startReverseString:(id)sender{
    
    self.reverseString.reverse = @"";
    [self.reverseString reverseString:self.textInput1.text];
    self.result.text = self.reverseString.reverse;
}

#pragma mark - Hanoi

-(void)updateUIFrom:(int)source to:(int)destination{
    
    switch (source) {
        case 1:
            [(NYStack *)[self.hanoiData objectAtIndex:destination - 1] pushObject:[(NYStack *)[self.hanoiData objectAtIndex:source - 1] peekObject]];
            int peek = [[(NYStack *)[self.hanoiData objectAtIndex:0] peekObject] intValue]; //which one, smallest, middle or largest?
            
            if (peek == 1) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.top1.alpha = 0;
                }];
                
                if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top2.alpha = 1;
                    }];
                }else if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top3.alpha = 1;
                    }];
                }

            }else if (peek == 2) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.middle1.alpha = 0;
                }];

                if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle2.alpha = 1;
                    }];
                }else if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle3.alpha = 1;
                    }];
                }
            }else if (peek == 3) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.bottom1.alpha = 0;
                }];
                
                if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom2.alpha = 1;
                    }];
                }else if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom3.alpha = 1;
                    }];
                }
            }
            
            [(NYStack *)[self.hanoiData objectAtIndex:0] popObject];
            break;
        case 2:
            [(NYStack *)[self.hanoiData objectAtIndex:destination - 1] pushObject:[(NYStack *)[self.hanoiData objectAtIndex:source - 1] peekObject]];
            int peek2 = [[(NYStack *)[self.hanoiData objectAtIndex:1] peekObject] intValue]; //which one, smallest, middle or largest?
            
            if (peek2 == 1) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.top2.alpha = 0;
                }];
                
                if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top1.alpha = 1;
                    }];
                }else if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top3.alpha = 1;
                    }];
                }
                
            }else if (peek2 == 2) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.middle2.alpha = 0;
                }];
                
                if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle1.alpha = 1;
                    }];
                }else if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle3.alpha = 1;
                    }];
                }
            }else if (peek2 == 3) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.bottom2.alpha = 0;
                }];
                
                if (destination == 3) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom3.alpha = 1;
                    }];
                }else if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom1.alpha = 1;
                    }];
                }
            }
            [(NYStack *)[self.hanoiData objectAtIndex:1] popObject];
            break;
        case 3:
            [(NYStack *)[self.hanoiData objectAtIndex:destination - 1] pushObject:[(NYStack *)[self.hanoiData objectAtIndex:source - 1] peekObject]];
            
            int peek3 = [[(NYStack *)[self.hanoiData objectAtIndex:2] peekObject] intValue]; //which one, smallest, middle or largest?
            
            if (peek3 == 1) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.top3.alpha = 0;
                }];
                
                if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top1.alpha = 1;
                    }];
                }else if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.top2.alpha = 1;
                    }];
                }
                
            }else if (peek3 == 2) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.middle3.alpha = 0;
                }];
                
                if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle1.alpha = 1;
                    }];
                }else if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.middle2.alpha = 1;
                    }];
                }
            }else if (peek3 == 3) {
                
                [UIView animateWithDuration:1 animations:^{
                    self.bottom3.alpha = 0;
                }];
                
                if (destination == 1) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom1.alpha = 1;
                    }];
                }else if (destination == 2) {
                    [UIView animateWithDuration:1 animations:^{
                        self.bottom2.alpha = 1;
                    }];
                }
            }
            [(NYStack *)[self.hanoiData objectAtIndex:1] popObject];
            break;
        default:
            break;
    }
}

#pragma mark - Resursive Drawing Delegate

-(void)addSubLayerToMainView:(CAShapeLayer *)layer{
    
    [self.view.layer addSublayer:layer];
}

#pragma mark - UITableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idTableCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.content objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.content.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:[self.segueId objectAtIndex:indexPath.row] sender:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - Private

-(NSArray<NSString *> *)convertStringToArray:(NSString *)string{
    return [string componentsSeparatedByString:@","];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.hanoi = [[Hanoi alloc] init];
    self.puzzle = [[RecursivePuzzle alloc] init];
    self.reverseString = [[ReverseString alloc] init];
    self.gcd = [[GCD alloc] init];
    self.drawing = [[RecursiveDrawing alloc] init];
    self.binary = [[PrintBinary alloc] init];
    self.dsum = [[DigitSum alloc] init];
    self.drawing.delegate = self;
    self.hanoi.delegate = self;
    
    self.segueId = [[NSMutableArray alloc] initWithObjects:@"idSPuzzle", @"idSHanoi", @"idSGCD", @"idSDrawing", @"idSString", @"idSBinary", @"idSSum", nil];
    self.content = [[NSMutableArray alloc] initWithObjects:@"Recursive Puzzle", @"Hanoi", @"GCD", @"Drawing", @"Reverse string", @"Print Binary", @"Digit Sum", nil];
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
