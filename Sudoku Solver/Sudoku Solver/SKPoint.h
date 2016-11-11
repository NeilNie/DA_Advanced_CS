//
//  SKPoint.h
//  Sudoku Solver
//
//  Created by Yongyang Nie on 11/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKPoint : NSObject

@property int x;
@property int y;
@property int var;

- (instancetype)initWithx:(int)x y:(int)y var:(int)var;

@end
