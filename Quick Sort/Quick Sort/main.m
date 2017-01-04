//
//  main.m
//  Quick Sort
//
//  Created by Yongyang Nie on 1/4/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "QuickSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        while (<#condition#>) {
            <#statements#>
        }
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@5,@7,@2,@9,@5,@3,@4,@6,@10,@1, nil];
        QuickSort *quickSort = [[QuickSort alloc] init];
        NSLog(@"%@", [quickSort quickSort:array]);
    }
    return 0;
}
