//
//  MZMove.h
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZMove : NSObject

@property int x;
@property int y;
@property int direction;
@property int from;
@property (nonatomic, strong) MZMove *parent;

- (instancetype)initWithPoint:(int)x y:(int)y parent:(MZMove *)move inDirection:(int)direction;

@end
