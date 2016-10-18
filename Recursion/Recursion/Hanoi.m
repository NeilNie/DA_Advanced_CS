//
//  Hanoi.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Hanoi.h"

@implementation Hanoi

-(void)Hanoi:(int)n source:(int)source destination:(int)destination temp:(int)open{
    
    if (n == 1) {
        [self.delegate updateUIFrom:source to:destination];
        NSLog(@"source %i destination %i ", source, destination);
    }else{
        [self Hanoi:n - 1 source:source destination:open temp:destination];
        [self Hanoi:1 source:source destination:destination temp:open];
        [self Hanoi:n - 1 source:open destination:destination temp:source];
    }
}

@end
