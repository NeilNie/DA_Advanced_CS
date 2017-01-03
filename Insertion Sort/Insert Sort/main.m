//
//  main.m
//  Insert Sort
//
//  Created by Yongyang Nie on 10/25/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InsertSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        InsertSort *sort = [[InsertSort alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@1,@5,@4,@2,@8,@3, nil];
        NSLog(@"%@", [sort insertionSort:array]);
    }
    return 0;
}
