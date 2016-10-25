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

//check is the linked list is empty
-(BOOL)isEmpty;

//clear the linked list
-(void)clear;

//print out evey element in the list
-(void)print;

//remove an object at a given index
-(void)removeAt:(int)index;

//return the first node of the list
-(LinkedListNode *)first;

//return the last node of the list. 
-(LinkedListNode *)last;

-(void)addObject:(id)object;

-(int)count;

-(LinkedListNode *)nodeAt:(int)index;

-(NodesBA)nodeBeforeAfter:(int)index;

//insert node at a given index.
//parameter: generic type, int
-(void)insert:(id)object atIndex:(int)index;

@end



