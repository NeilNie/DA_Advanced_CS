//
//  DigitSum.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 9/30/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "DigitSum.h"

@implementation DigitSum


+(int)numberOfDigit:(int)x{
    
    if (x < 10) {
        return x;
    }else{
        return x % 10 + [self numberOfDigit:x / 10];
    }
}

@end
