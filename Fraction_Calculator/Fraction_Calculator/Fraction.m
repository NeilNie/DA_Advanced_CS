//
//  Fraction.m
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (instancetype)initNumerator:(int)n denominator:(int)d
{
    self = [super init];
    if (self) {
        self.numerator = n;
        self.denominator = d;
    }
    return self;
}

-(float)calculateDecimal{
    
    return self.numerator / self.denominator;
}

-(void)simplify{
    
    if (((float)self.denominator / (float)self.numerator) == 1.0) {
        self.numerator = 1;
        self.denominator = self.denominator / self.numerator;
    }
    
    for (int i = 9; i >= 2; i--) {
        
        while ((self.denominator % i) == 0 && (self.numerator % i) == 0) {
            self.denominator = self.denominator / i;
            self.numerator = self.numerator / i;
        }
    }
}

-(Fraction *)commonDenominator:(Fraction *)f{
    
    if (self.denominator == f.denominator) {
        return f;
    }
    
    int temp = self.denominator;
    
    self.numerator = self.numerator * f.denominator;
    self.denominator = self.denominator * f.denominator;
    
    f.numerator = f.numerator * temp;
    f.denominator = f.denominator * temp;
    
    return f;
}

-(void)reset{
    
    self.denominator = 0;
    self.numerator = 0;
}

@end
