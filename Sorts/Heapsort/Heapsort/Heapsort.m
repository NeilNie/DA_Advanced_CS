//
//  Heapsort.m
//  Heapsort
//
//  Created by Yongyang Nie on 1/4/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Heapsort.h"

@implementation Heapsort

-(void)heapsort:(NSMutableArray *)array{
    
    for (int i = (int)array.count / 2 - 1; i >= 0; i--)
        [Heapsort heapify:array atIndex:i count:(int)array.count];
    
    for (int i = (int)array.count - 1; i >= 0; i--) {
        
        [Heapsort swap:0 with:i in:array];
        [Heapsort heapify:array atIndex:0 count:i];
    }
}

+(void)heapify:(NSMutableArray *)array atIndex:(int)i count:(int)n{
    
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * 1 + 2;
    
    if (l < n && [[array objectAtIndex:l] integerValue] > [[array objectAtIndex:largest] intValue]) {
        largest = l;
    }
    if (r < n && [[array objectAtIndex:r] integerValue] > [[array objectAtIndex:largest] intValue]) {
        largest = r;
    }
    
    if (largest != i) {
        [Heapsort swap:i with:largest in:array];
        
        [Heapsort heapify:array atIndex:largest count:n];
    }
}

+(void)swap:(int)x with:(int)y in:(NSMutableArray *)array{
    
    
    
}

@end
