//
//  Calculator.h
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property float accumulator;
@property char operation;
@property float operationValue;

-(void)beginCalculation;
-(void)calculate;
-(void)calculationEnded;
-(void)updateCalculator;

-(void)add;
-(void)subtract;
-(void)divide;
-(void)multiply;

@end
