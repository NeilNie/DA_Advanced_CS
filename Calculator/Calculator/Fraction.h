//
//  Fraction.h
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

//You should take the problem description for chapter 6, problem 4 (a calculator program) and modify it so that you have a Fraction Calculator program.  In the chapters we have gone through you have been provided a fraction class and a calculator class, so in some sense this program is merely putting those together.  You should have a FractionCalculator class and a Fraction class each with separate header (interface) and implementation files.  You should be able to handle the operations of +, -, *, /, simplify, and E.  You should think of how you want the user to enter fractions.  Create a clear command line interface.

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator;
@property int denominator;

- (instancetype)initNumerator:(int)n denominator:(int)d;
- (float)calculateDecimal;
-(Fraction *)commonDenominator:(Fraction *)f;
-(void)simplify;

@end
