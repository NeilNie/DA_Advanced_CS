//
//  main.m
//  Merge Sort
//
//  Created by Yongyang Nie on 11/2/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MergeSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *array = [[NSArray alloc] initWithObjects:@3, @6, @1, @2, @4, @5, @9, @7, @8, nil];
        NSLog(@"%@", array);
        NSLog(@"%@", [MergeSort mergeSort:array]);
    }
    return 0;
}
