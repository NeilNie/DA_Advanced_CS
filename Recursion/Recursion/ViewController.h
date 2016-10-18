//
//  ViewController.h
//  Recursion_HW
//
//  Created by Yongyang Nie on 9/28/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hanoi.h"
#import "RecursivePuzzle.h"
#import "ReverseString.h"
#import "GCD.h"
#import "RecursiveDrawing.h"
#import "PrintBinary.h"
#import "DigitSum.h"
#import "NYStack.h"

@interface ViewController : UIViewController <RecursiveDrawingDelegate, HanoiDelegate>

//Objects
@property (nonatomic, strong) NSMutableArray *hanoiData;
@property (nonatomic, strong) Hanoi *hanoi;
@property (nonatomic, strong) RecursivePuzzle *puzzle;
@property (nonatomic, strong) ReverseString *reverseString;
@property (nonatomic, strong) GCD *gcd;
@property (nonatomic, strong) RecursiveDrawing *drawing;
@property (nonatomic, strong) PrintBinary *binary;
@property (nonatomic, strong) DigitSum *dsum;

//Hanoi
@property (nonatomic, weak) IBOutlet UIView *top1;
@property (nonatomic, weak) IBOutlet UIView *middle1;
@property (nonatomic, weak) IBOutlet UIView *bottom1;
@property (nonatomic, weak) IBOutlet UIView *top2;
@property (nonatomic, weak) IBOutlet UIView *middle2;
@property (nonatomic, weak) IBOutlet UIView *bottom2;
@property (nonatomic, weak) IBOutlet UIView *top3;
@property (nonatomic, weak) IBOutlet UIView *middle3;
@property (nonatomic, weak) IBOutlet UIView *bottom3;
//General
@property (weak, nonatomic) IBOutlet UITextField *textInput1;
@property (weak, nonatomic) IBOutlet UITextField *textInput2;
@property (weak, nonatomic) IBOutlet UILabel *result;
//Local
@property (nonatomic, strong) NSMutableArray *content;
@property (nonatomic, strong) NSMutableArray *segueId;
@property (nonatomic, weak) IBOutlet UITableView *table;

@end
