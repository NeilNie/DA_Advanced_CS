//
//  RecursivePuzzle.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "RecursivePuzzle.h"

@implementation RecursivePuzzle

-(BOOL)puzzle:(NSArray *)squares IsSolveableIfStartingAt:(int)start{
    
    int index = [[squares objectAtIndex:start] intValue];
    
    if(start + index > squares.count && start - index < 0){
        return NO;
    }else if ([[squares objectAtIndex:start] isEqualToString:@"0"]){
        return YES;
    }
    else{
        if (index + start > squares.count) {
            return [self puzzle:squares IsSolveableIfStartingAt:start - index];
        }else{
            return [self puzzle:squares IsSolveableIfStartingAt:start + index];
        }
    }
}

@end
