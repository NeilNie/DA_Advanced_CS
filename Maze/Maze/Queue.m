//
//  Queue.m
//  Queue
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Queue.h"
#import "LinkedList.h"

@interface Queue ()

//note: objects is private and you can implement it with NSMutableArray.
@property (strong, nonatomic) NSMutableArray *objects;

@end

@implementation Queue

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.objects = [[LinkedList alloc] init];
    }
    return self;
}

-(id)dequeue{
    id object = [self.objects firstObject];
    [self.objects removeObjectAtIndex:0];
    return object;
}
-(void)enqueue:(id)object{
    [self.objects addObject:object];
}
-(NSUInteger)count{
    return [self.objects count];
}
-(BOOL)isEmpty{
    return [self.objects firstObject] == nil;
}

-(void)printQueue{
    NSLog(@"%@", self.objects);
}

-(NSString *)description{
    return [self.objects description];
}

-(BOOL)contains:(id)object{
    return [self.objects containsObject:object];
}

@end
