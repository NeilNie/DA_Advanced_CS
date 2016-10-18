//
//  main.m
//  Calculator
//
//  Created by Yongyang Nie on 9/16/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "Fraction.h"
#import "FractionCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        char i;
        printf("Please type f for fraction calculator and i for interger calculation \n");
        scanf("%c", &i);
        
        if (i == 'f') {
            FractionCalculator *calculator = [[FractionCalculator alloc] init];
            [calculator beginCalculation];
            
        }else if (i == 'i') {
            Calculator *calculator = [[Calculator alloc] init];
            [calculator beginCalculation];
        }
    }
    
    return 0;
}
