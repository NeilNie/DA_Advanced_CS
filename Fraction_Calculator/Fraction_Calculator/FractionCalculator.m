//
//  FractionCalculator.m
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "FractionCalculator.h"

@implementation FractionCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fractionOperation = [[Fraction alloc] init];
        self.fractionAccumulator = [[Fraction alloc] init];
    }
    return self;
}

-(NSString *)superscript:(int)num {
    
    NSDictionary *superscripts = @{@0: @"\u2070", @1: @"\u00B9", @2: @"\u00B2", @3: @"\u00B3", @4: @"\u2074", @5: @"\u2075", @6: @"\u2076", @7: @"\u2077", @8: @"\u2078", @9: @"\u2079"};
    return superscripts[@(num)];
}

-(NSString *)subscript:(int)num {
    
    NSDictionary *subscripts = @{@0: @"\u2080", @1: @"\u2081", @2: @"\u2082", @3: @"\u2083", @4: @"\u2084", @5: @"\u2085", @6: @"\u2086", @7: @"\u2087", @8: @"\u2088", @9: @"\u2089"};
    return subscripts[@(num)];
}

-(NSString *)fraction:(int)numerator denominator:(int)denominator {
    
    NSMutableString *result = [NSMutableString string];
    
    NSString *one = [NSString stringWithFormat:@"%i", numerator];
    for (int i = 0; i < one.length; i++) {
        [result appendString:[self superscript:[[one substringWithRange:NSMakeRange(i, 1)] intValue]]];
    }
    [result appendString:@"/"];
    
    NSString *two = [NSString stringWithFormat:@"%i", denominator];
    for (int i = 0; i < two.length; i++) {
        [result appendString:[self subscript:[[two substringWithRange:NSMakeRange(i, 1)] intValue]]];
    }
    return result;
}

-(void)setValue:(char)operation{
    
    switch (operation) {
        case 'N':
            self.fractionOperation.numerator = self.OperationValue;
            break;
        case 'D':
            self.fractionOperation.denominator = self.OperationValue;
            [self.delegate displayResult:[self fraction:self.fractionOperation.numerator denominator:self.fractionOperation.denominator]];
            break;
    
        default:
            break;
    }

}

-(void)calculate{

    if (self.fractionAccumulator.denominator == 0) {
        self.fractionAccumulator = self.fractionOperation;
        [self.delegate displayResult:[self fraction:self.fractionOperation.numerator denominator:self.fractionOperation.denominator]];
    }
    
    else {
        
        switch (self.operation) {
            case '-':
                [self subtract];
                
                break;
            case '+':
                
                [self add];
                
                break;
            case '/':
                [self divide];
                
                break;
            case '*':
                [self multiply];
                
                break;
            case 'C':
                [self.fractionOperation reset];
                [self.fractionAccumulator reset];
                break;
                
            default:
                break;
        }
        [self.delegate displayResult:[self fraction:self.fractionAccumulator.numerator denominator:self.fractionAccumulator.denominator]];
    }
    
}

-(void)add{

    Fraction *f = [self.fractionAccumulator commonDenominator:self.fractionOperation];
    self.fractionOperation = f;
    self.fractionAccumulator.numerator = self.fractionAccumulator.numerator + self.fractionOperation.numerator;
    [self.fractionAccumulator simplify];
}

-(void)subtract{
    
    self.fractionOperation = [self.fractionAccumulator commonDenominator:self.fractionOperation];
    self.fractionAccumulator.numerator = self.fractionAccumulator.numerator - self.fractionOperation.numerator;
    [self.fractionAccumulator simplify];
}

-(void)divide{
    
    Fraction *f = [[Fraction alloc] init];
    f.numerator = self.fractionAccumulator.numerator * self.fractionOperation.denominator;
    f.denominator = self.fractionAccumulator.denominator * self.fractionOperation.numerator;
    [f simplify];
    self.fractionAccumulator = f;
}

-(void)multiply{
    
    Fraction *f = [[Fraction alloc] init];
    f.numerator = self.fractionAccumulator.numerator * self.fractionOperation.numerator;
    f.denominator = self.fractionAccumulator.denominator * self.fractionOperation.denominator;
    [f simplify];
    self.fractionAccumulator = f;
}

@end
