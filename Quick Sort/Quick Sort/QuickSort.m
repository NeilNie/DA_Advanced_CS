//
//  QuickSort.m
//  Quick Sort
//
//  Created by Yongyang Nie on 1/4/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

-(NSArray *)quickSort:(NSMutableArray *)array{
    
    if (array.count <= 1) return array;
    
    int center = [array[array.count / 2] intValue];
    NSMutableArray *smaller = [self smaller:array than:center];
    NSMutableArray *equal = [self equal:array to:center];
    NSMutableArray *greater = [self greater:array than:center];
    
    return [[[self quickSort:smaller] arrayByAddingObjectsFromArray:equal] arrayByAddingObjectsFromArray:[self quickSort:greater]];
}

-(NSMutableArray *)smaller:(NSMutableArray *)array than:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] < x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
}

-(NSMutableArray *)greater:(NSMutableArray *)array than:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] > x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
}

-(NSMutableArray *)equal:(NSMutableArray *)array to:(int)x{
    
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([[array objectAtIndex:i] intValue] == x) {
            [result addObject:[array objectAtIndex:i]];
        }
    }
    return result;
}

@end
