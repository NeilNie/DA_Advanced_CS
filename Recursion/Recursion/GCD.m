//
//  GCD.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "GCD.h"

@implementation GCD

+(int)GCDof:(int) x and: (int)y{
    
    //the greatest common divisor of y and the remainder of x divided by y.
    if (x % y == 0) {
        return y;
    }else{
        return [self GCDof:y and:x % y];
    }
}

@end
