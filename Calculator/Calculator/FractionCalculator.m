//
//  FractionCalculator.m
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "FractionCalculator.h"

@implementation FractionCalculator

-(void)beginCalculation{
    
    self.fractionAccumulator = [[Fraction alloc] init];
    
    [self updateCalculator];
    
    [self calculate];
}

-(void)calculate{
    
    if (self.operation == 'S') {
        self.fractionAccumulator = self.fractionOperation;
        printf("set value to %i|%i \n", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
    }else if (self.operation == 'P'){
        self.fractionAccumulator = self.fractionOperation;
        [self.fractionAccumulator simplify];
        NSLog(@"simplified to %i|%i", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
    }else{
        [super calculate];
        
    }
    [self updateCalculator];
}

-(void)add{

    Fraction *f = [self.fractionAccumulator commonDenominator:self.fractionOperation];
    self.fractionOperation = f;
    self.fractionAccumulator.numerator = self.fractionAccumulator.numerator + self.fractionOperation.numerator;
    [self.fractionAccumulator simplify];
    
    printf("current value %i|%i \n", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
}

-(void)subtract{
    
    self.fractionOperation = [self.fractionAccumulator commonDenominator:self.fractionOperation];
    self.fractionAccumulator.numerator = self.fractionAccumulator.numerator - self.fractionOperation.numerator;
    [self.fractionAccumulator simplify];
    
    printf("current value %i|%i \n", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
}

-(void)divide{
    
    Fraction *f = [[Fraction alloc] init];
    f.numerator = self.fractionAccumulator.numerator * self.fractionOperation.denominator;
    f.denominator = self.fractionAccumulator.denominator * self.fractionOperation.numerator;
    [f simplify];
    self.fractionAccumulator = f;
    
    printf("current value %i|%i \n", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
}

-(void)multiply{
    
    Fraction *f = [[Fraction alloc] init];
    f.numerator = self.fractionAccumulator.numerator * self.fractionOperation.numerator;
    f.denominator = self.fractionAccumulator.denominator * self.fractionOperation.denominator;
    [f simplify];
    self.fractionAccumulator = f;
    
    printf("current value %i|%i \n", self.fractionAccumulator.numerator, self.fractionAccumulator.denominator);
}

-(void)updateCalculator{
    
    int numerator;
    int denominator;
    char operation;
    
    printf("Please enter a fraction with | and an operator \n");
    scanf("%i|%i %c", &numerator, &denominator, &operation);
    self.fractionOperation = [[Fraction alloc] initNumerator:numerator denominator:denominator];
    self.operation = operation;
    
    if (self.fractionOperation.denominator == 0 || self.fractionOperation.denominator == 0) {
        printf("invalid input program will end");
        return;
    }
    
    [self calculate];
}

@end
