//
//  Calculator.m
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)beginCalculation{

    [self updateCalculator];
    [self calculate];
}

-(void)calculate{

    switch (self.operation) {
        case '-':
            [self subtract];
            [self updateCalculator];
            
            break;
        case '+':
            
            [self add];
            [self updateCalculator];
            
            break;
        case '/':
            
            [self divide];
            [self updateCalculator];
            
            break;
        case '*':
            
            [self multiply];
            [self updateCalculator];
            
            break;
        case 'E':
            [self calculationEnded];
            break;
        case 'S':
            self.accumulator = self.operationValue;
            self.operationValue = 0.0f;
            printf("current value %f \n", self.accumulator);
            [self updateCalculator];
            
            break;
        case 'D':
            
            if ([self isPalindrome:self.operationValue]) {
                printf("It is a Palindrome \n");
            }else{
                printf("It is not a Palindrome \n");
            }
            
            [self updateCalculator];
            
            break;
        default:
            
            NSLog(@"unknown operation program will end");
            break;
    }
}

-(BOOL)isPalindrome:(int)x{
    
    int digits = [self digits:x];
    
    for (int i = 1; i <= digits / 2; i ++) {
        
        if (x / [self pow:10 exponent:i] != x / [self pow:10 exponent:digits - i]) {
            return NO;
        }
    }
    
    return YES;
}

-(int)digits:(int)x{
    
    int count = 0;
    while (x > 0) {
        x = x / 10;
        count++;
    }
    return count;
}

-(int)pow:(int)x exponent:(int)e{
    
    if (e == 0) {
        return 1;
    }else if (e == 1){
        return x;
    }else{
        
        int result = 0;
        for (int i = e; i > 0; i--) {
            
            if (result == 0) {
                result = x * x;
            }else{
                result = result * x;
            }
        }
        return result;
    }
}

-(void)add
{
    self.accumulator = self.accumulator + self.operationValue;
    printf("= %f \n", self.accumulator);
}
-(void)subtract
{
    self.accumulator = self.accumulator - self.operationValue;
    printf("= %f \n", self.accumulator);
}
-(void)multiply
{
    self.accumulator = self.accumulator * self.operationValue;
    printf("= %f \n", self.accumulator);
}
-(void)divide
{
    if (self.operation != 0) {
        self.accumulator = self.accumulator / self.operationValue;
        printf("= %f \n", self.accumulator);
    }
}

-(void)calculationEnded
{
    printf("result is %f", self.accumulator);
    self.accumulator = 0.0f;
    self.operationValue = 0.0f;
}

-(void)updateCalculator
{
    float operationValue;
    char operation;
    printf("Please enter value \n");
    scanf("%f %c", &operationValue, &operation);
    
    self.operation = operation;
    self.operationValue = operationValue;
    [self calculate];
}

@end
