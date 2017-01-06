//
//  MergeSort.m
//  Merge Sort
//
//  Created by Yongyang Nie on 11/2/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if ([unsortedArray count] < 2)
        return unsortedArray;
    
    int middle = (int)[unsortedArray count] / 2;
    NSArray *rightArr = [unsortedArray subarrayWithRange:NSMakeRange(0, middle)];
    NSArray *leftArr = [unsortedArray subarrayWithRange:NSMakeRange(middle, ([unsortedArray count] - middle))];
    
    return [MergeSort mergeLeft:[MergeSort mergeSort:leftArr] right:[MergeSort mergeSort:rightArr]];
}

+(NSArray *)mergeLeft:(NSArray *)left right:(NSArray *)right{
    
    int leftIndex = 0;
    int rightIndex = 0;
    NSMutableArray *ordered = [NSMutableArray array];
    
    while (leftIndex < left.count && rightIndex < right.count) {
        
        if ([(NSNumber *)left[leftIndex] intValue] < [(NSNumber *)right[rightIndex] intValue]) {
            [ordered addObject:left[leftIndex]];
            leftIndex++;
        }else if ([(NSNumber *)left[leftIndex] intValue] > [(NSNumber *)right[rightIndex] intValue]){
            [ordered addObject:right[rightIndex]];
            rightIndex++;
        }else{
            [ordered addObject:left[leftIndex]];
            leftIndex++;
            [ordered addObject:right[rightIndex]];
            rightIndex++;
        }
    }
    while (leftIndex < left.count) {
        [ordered addObject:left[leftIndex]];
        leftIndex++;
    }
    while (rightIndex < right.count) {
        [ordered addObject:right[rightIndex]];
        rightIndex++;
    }
    
    return ordered;
}


-(void)beginExperiment{
    
    for (int i = 10; i < 100000000; i = i * 10) {
        
        NSDate *methodStart = [NSDate date];
        
        NSMutableArray *numbers  = [NSMutableArray array];
        while (numbers.count < i) {
            long x = arc4random()%i * 10;
            [numbers addObject:[NSNumber numberWithLong:x]];
        }
        NSLog(@"count; %li", numbers.count);
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"construction executionTime = %f", executionTime);
        
        NSDate *method2Start = [NSDate date];
        
        [MergeSort mergeSort:numbers];
        
        NSDate *method2Finish = [NSDate date];
        NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
        NSLog(@"sorting executionTime = %f", executionTime2);
        
        NSLog(@"------------------------------");
    }
}
@end
