//
//  FractionCalculator.h
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Calculator.h"
#import "Fraction.h"

@interface FractionCalculator : Calculator

@property (strong, nonatomic) Fraction *fractionOperation;
@property (strong, nonatomic) Fraction *fractionAccumulator;

@end
