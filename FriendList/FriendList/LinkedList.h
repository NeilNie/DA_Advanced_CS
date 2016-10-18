//
//  LinkListNode.h
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListNode.h"

typedef struct NodesBA {
    __unsafe_unretained LinkedListNode *before;
    __unsafe_unretained LinkedListNode *after;
} NodesBA;

@interface LinkedList : NSObject

@property (strong, nonatomic) LinkedListNode *head;

-(BOOL)isEmpty;

-(void)clear;

-(void)print;

-(void)removeAt:(int)index;

-(LinkedListNode *)first;

-(LinkedListNode *)last;

-(void)addObject:(id)object;

-(int)count;

-(LinkedListNode *)nodeAt:(int)index;

-(NodesBA)nodeBeforeAfter:(int)index;

-(void)insert:(id)object atIndex:(int)index;

@end



