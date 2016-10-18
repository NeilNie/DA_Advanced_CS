//
//  Hanoi.h
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
// http://www.taoyue.com/tutorials/pascal/pas4g.html

#import <Foundation/Foundation.h>

@interface Hanoi : NSObject

@property (retain, nonatomic) id delegate;

-(void)Hanoi:(int)n source:(int)source destination:(int)destination temp:(int)open;

@end

@protocol HanoiDelegate <NSObject>

-(void)updateUIFrom:(int)source to:(int)destination;

@end
