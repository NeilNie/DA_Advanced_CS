//
//  InsertSort.m
//  Insert Sort
//
//  Created by Yongyang Nie on 10/25/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "InsertSort.h"

@implementation InsertSort

-(NSMutableArray *)insertionSort:(NSMutableArray *)array{
    
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

@end
