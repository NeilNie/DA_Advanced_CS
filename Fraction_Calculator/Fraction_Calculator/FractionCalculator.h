//
//  FractionCalculator.h
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Fraction.h"

@interface FractionCalculator : NSObject

@property char operation;
@property int OperationValue;
@property (strong, nonatomic) Fraction *fractionOperation;
@property (strong, nonatomic) Fraction *fractionAccumulator;
@property (retain, nonatomic) id delegate;

-(void)setValue:(char)operation;
-(void)calculate;

@end

@protocol FractionDelegate <NSObject>

-(void)displayResult:(NSString *)result;

@end
