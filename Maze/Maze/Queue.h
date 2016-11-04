//
//  Queue.h
//  Queue
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

//init a queue
- (instancetype)init;

//dequeue: remove the first object in the queue
-(id)dequeue;

//dequeue: add an object to the back of the queue
-(void)enqueue:(id)object;

//return number of objects in a queue
-(NSUInteger)count;

//check is queue is empty
-(BOOL)isEmpty;

//prints all objects in the queue
-(void)printQueue;

@end
