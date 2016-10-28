//
//  LinkListNode.h
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListNode.h"

@interface LinkedList : NSObject

@property (strong, nonatomic) LinkedListNode *__nullable head;

//check is the linked list is empty
-(BOOL)isEmpty;

//clear the linked list
-(void)clear;

//print out evey element in the list
-(void)print;

//remove an object at a given index
-(void)removeAt:(int)index;

//return the first node of the list
-(LinkedListNode *__nullable)first;

//return the last node of the list. 
-(LinkedListNode *__nullable)last;

-(void)addObject:(id __nonnull)object;

-(int)count;

-(LinkedListNode *__nonnull)nodeAt:(int)index;

//-(NodesBA)nodeBeforeAfter:(int)index;

//insert node at a given index.
//parameter: generic type, int
-(void)insert:(id __nonnull)object atIndex:(int)index;

@end



