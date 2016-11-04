//
//  Stack.m
//  Maze
//
//  Created by Yongyang Nie on 10/28/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (strong, nonatomic, nonnull) LinkedList *list;

@end

@implementation Stack

#pragma mark - Constructor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.list = [[LinkedList alloc] init];
    }
    return self;
}

-(void)push:(id)object{
    [self.list addObject:object];
}
-(void)pop{
    [self.list removeAt:[self.list count] - 1];
}
-(id)peek{
    return [(LinkedListNode *)[self.list nodeAt:[self.list count] - 1] object];
}
-(BOOL)isEmpty{
    return self.list.head == nil;
}

-(void)print{
    
    [self.list print];
    NSLog(@"%i items in stack", [self count]);
}

@end
