//
//  InsertSort.m
//  Insert Sort
//
//  Created by Yongyang Nie on 10/25/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "InsertSort.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@implementation InsertSort

+(NSMutableArray *)insertionSort:(NSMutableArray *)array{
    
    for (int i = 0; i < array.count; i++) {
        int y = i;
        while (y > 0 && [[array objectAtIndex:y] intValue] < [[array objectAtIndex:y - 1] intValue]) {
            id temp = array[y - 1];
            array[y - 1] = array[y];
            [array replaceObjectAtIndex:y withObject:temp];
            y--;
        }
    }
    return array;
}

+(void)beginExperiment{
    
    for (int i = 10; i < 1000000; i = i * 10) {
        
                NSDate *methodStart = [NSDate date];
        
        NSMutableArray *numbers  = [NSMutableArray array];
        while (numbers.count < i) {
            long x = arc4random()%i * 10;
            [numbers addObject:[NSNumber numberWithLong:x]];
        }
        //MDLog(@"count; %li", numbers.count);
        
                NSDate *methodFinish = [NSDate date];
                NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
                MDLog(@"%f", executionTime);
        
        NSDate *method2Start = [NSDate date];
        
        [InsertSort insertionSort:numbers];
        
        NSDate *method2Finish = [NSDate date];
        NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
        //MDLog(@"%f", executionTime2);
        
        //NSLog(@"------------------------------");
    }
}

@end
