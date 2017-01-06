//
//  RadixSort.m
//  Radix Sort
//
//  Created by Yongyang Nie on 1/6/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "RadixSort.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@implementation RadixSort

+(int)maxVal:(NSMutableArray *)array{
    
    int m = [[array objectAtIndex:0] intValue];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] > m)
            m = [[array objectAtIndex:i] intValue];
    }
    return m;
}

+(NSMutableArray *)fill:(int)c n:(int)n{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < c; i++) {
        [array addObject:[NSNumber numberWithInt:n]];
    }
    return array;
}

+(NSMutableArray *)countSort:(NSMutableArray *)array exp:(int)exp{
    
    NSMutableArray *output = [RadixSort fill:(int)array.count n:0];
    NSMutableArray *count = [RadixSort fill:10 n:0];
    
    // Store count of occurrences in count[]
    for (int i = 0; i < array.count; i++){
        int x = [[count objectAtIndex:([[array objectAtIndex:i] intValue] / exp) %10] intValue] + 1;
        [count replaceObjectAtIndex:([[array objectAtIndex:i] intValue] / exp) %10  withObject:[NSNumber numberWithInt:x]];
    }
    
    // Change count[i] so that count[i] now contains actual
    //  position of this digit in output[]
    for (int i = 1; i < 10; i++){
        int x = [[count objectAtIndex:i] intValue] + [[count objectAtIndex:i - 1] intValue];
        [count replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:x]];
    }
    
    // Build the output array
    for (int i = (int)array.count - 1; i >= 0; i--){
        [output replaceObjectAtIndex:[[count objectAtIndex:([[array objectAtIndex:i] intValue] / exp)%10 ] intValue] - 1 withObject:[array objectAtIndex:i]];
        int x = [[count objectAtIndex:([[array objectAtIndex:i] intValue] / exp) %10] intValue] - 1;
        [count replaceObjectAtIndex:([[array objectAtIndex:i] intValue] / exp) %10 withObject:[NSNumber numberWithInt:x]];
    }
    return output;
}

+(NSMutableArray *)radixSort:(NSMutableArray *)array{
    
    int m = [RadixSort maxVal:array];
    
    for (int i = 1; m / i > 0; i *= 10) {
        array = [RadixSort countSort:array exp:i];
    }
    return array;
}

+(void)beginExperiment{
    
    for (int i = 10; i < 100000000; i = i * 10) {
        
        //        NSDate *methodStart = [NSDate date];
        
        NSMutableArray *numbers  = [NSMutableArray array];
        while (numbers.count < i) {
            long x = arc4random()%i * 10;
            [numbers addObject:[NSNumber numberWithLong:x]];
        }
        //MDLog(@"count; %li", numbers.count);
        
        //        NSDate *methodFinish = [NSDate date];
        //        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        //        MDLog(@"%f", executionTime);
        
        NSDate *method2Start = [NSDate date];
        
        [RadixSort radixSort:numbers];
        
        NSDate *method2Finish = [NSDate date];
        NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
        MDLog(@"%f", executionTime2);
        
        //NSLog(@"------------------------------");
    }
}

@end

