//
//  QuickSort.m
//  Quick Sort
//
//  Created by Yongyang Nie on 1/4/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "QuickSort.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@implementation QuickSort

+(NSArray *)quickSort:(NSMutableArray *)array{
    
    if (array.count <= 1) return array;
    
    int center = [array[array.count / 2] intValue];
    NSMutableArray *smaller = [QuickSort smaller:array than:center];
    NSMutableArray *equal = [QuickSort equal:array to:center];
    NSMutableArray *greater = [QuickSort greater:array than:center];
    
    return [[[self quickSort:smaller] arrayByAddingObjectsFromArray:equal] arrayByAddingObjectsFromArray:[self quickSort:greater]];
}

+(NSMutableArray *)smaller:(NSMutableArray *)array than:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] < x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
}

+(NSMutableArray *)greater:(NSMutableArray *)array than:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] > x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
}

+(NSMutableArray *)equal:(NSMutableArray *)array to:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] == x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
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
        
        [QuickSort quickSort:numbers];
        
        NSDate *method2Finish = [NSDate date];
        NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
        MDLog(@"%f", executionTime2);
        
        //NSLog(@"------------------------------");
    }
}

@end
