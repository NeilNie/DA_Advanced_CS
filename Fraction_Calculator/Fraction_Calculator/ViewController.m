//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by Yongyang Nie on 9/23/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
// http://stackoverflow.com/questions/30859359/display-fraction-number-in-uilabel

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)displayResult:(NSString *)result{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.display.text = [NSString stringWithString:result];
    });
    NSLog(@"%@", self.display.text);
}

-(void)setUpView{
    
    for (UIButton *view in self.buttons) {
        view.layer.cornerRadius = 15;
        view.layer.shadowRadius = 2.0f;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        view.layer.shadowOffset = CGSizeMake(-1.0f, 3.0f);
        view.layer.shadowOpacity = 0.8f;
        view.layer.masksToBounds = NO;
    }
}

-(IBAction)setValuePressed:(id)sender{
    
    [self.calculator setValue:[[(UIButton *)sender titleLabel].text UTF8String][0]];
    self.calculator.OperationValue = 0;
    self.display.text = @"";
}

-(IBAction)OperationPressed:(id)sender{
    
    self.calculator.operation = [[(UIButton *)sender titleLabel].text UTF8String][0];
    [self.calculator calculate];
}

-(IBAction)equalPressed:(id)sender{
    [self.calculator calculate];
}

-(IBAction)NumberPressed:(id)sender{
    
    NSString *buttonString = [(UIButton *)sender titleLabel].text;
    self.calculator.OperationValue = self.calculator.OperationValue * 10 + [buttonString intValue];
    self.display.text = [NSString stringWithFormat:@"%.0d", self.calculator.OperationValue];
}

- (void)viewDidLoad {
    
    [self setUpView];
    self.calculator = [[FractionCalculator alloc] init];
    self.calculator.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
