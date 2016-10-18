//
//  NYStack.h
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/5/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYStack : NSObject <NSFastEnumeration>

@property (nonatomic, assign, readonly) NSUInteger count;

-(id)initWithArray:(NSArray*)array;

-(void)pushObject:(id)object;

-(void)pushObjects:(NSArray*)objects;

-(id)popObject;

-(id)peekObject;

@end
