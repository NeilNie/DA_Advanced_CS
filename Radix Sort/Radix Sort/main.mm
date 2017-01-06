//
//  main.m
//  Radix Sort
//
//  Created by Yongyang Nie on 1/6/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "RadixSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        for (int i = 0; i < 3; i++) {
            [RadixSort beginExperiment];
            NSLog(@"ended");
        }
    }
    return 0;
}
