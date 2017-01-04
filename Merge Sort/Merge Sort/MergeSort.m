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


 
// the other implementation
/*
+(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count]){
        
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue]){
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else{
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}
*/
@end
