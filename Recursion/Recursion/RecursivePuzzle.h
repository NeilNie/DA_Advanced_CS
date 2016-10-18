//
//  RecursivePuzzle.h
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecursivePuzzle : NSObject

-(BOOL)puzzle:(NSArray *)squares IsSolveableIfStartingAt:(int)start;

@end
