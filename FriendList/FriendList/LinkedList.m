//
//  LinkListNode.m
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "LinkedList.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@implementation LinkedList

#pragma mark - Constructor

- (instancetype)initWithHead:(LinkedListNode *)node{
    
    self = [super init];
    if (self) {
        self.head = node;
    }
    return self;
}

#pragma mark - Public methods

-(BOOL)isEmpty{
    return self.head == nil;
}

//return first node in linked list(head).
-(LinkedListNode *)first{
    return self.head;
}

//return last node in linked list
-(LinkedListNode *)last{
    
    if ([self count] == 0)
        return [self nodeAt:[self count]];
    return [self nodeAt:[self count] - 1];
}

//add object to linked list
-(void)addObject:(id)object{
    
    LinkedListNode *node = [[LinkedListNode alloc] initWithObject:object];
    if ([self last]) {
        node.previous = [self last];
        [self last].next = node;
    }else{
        self.head = node;
    }
}

//count total items in linked list
-(int)count{
    
    LinkedListNode *node = self.head;
    int count = 0;
    if (self.head) {
        count++;
        while (node.next != nil) {
            count++;
            node = node.next;
        }
    }
    return count;
}

-(void)insert:(id)object atIndex:(int)index{
    
    if (index > [self count])
        @throw [NSException exceptionWithName:@"Index out of bounds" reason:[NSString stringWithFormat:@"index %i out of bound 0...%i", index, [self count]] userInfo:nil];

    LinkedListNode *newNode = [[LinkedListNode alloc] initWithObject:object];
    LinkedListNode *findNode = self.head;
    int count = 0;
    while (count < index && count < [self count]) {
        count ++;
        findNode = findNode.next;
    }
    newNode.previous = findNode;
    newNode.next = findNode.next;
    findNode.next = newNode;
}

//remove an object at a given index
-(void)removeAt:(int)index{
    
    if (index > [self count])
        @throw [NSException exceptionWithName:@"Index out of bounds" reason:[NSString stringWithFormat:@"index %i out of bound 0...%i", index, [self count]] userInfo:nil];

    LinkedListNode *node = [self nodeAt:index];
    if (index == 0) {
        self.head = node.next;
    }else{
        node.previous.next = node.next;
        node.next.previous = node.previous;
        node = nil;
    }
}

#pragma mark - Helpers (mainly recursive methods)

//clear all objects in linked list recursively.
-(void)clear{self.head = nil;}

-(void)print{ NSLog(@"Linked List:"); [self printNode:self.head];}

//return a node at a certain index
-(LinkedListNode *__nonnull)nodeAt:(int)index{
    
    if (index >= 0) {
        LinkedListNode *node = self.head;
        int count = 0;
        while (count < index && count < [self count]) {
            count ++;
            node = node.next;
        }
        return node;
    }
    @throw [NSException exceptionWithName:@"Linked List Out of Bounds" reason:@"index < 0 || index > LinkedList upperbound" userInfo:nil];
}

//print out node, implemented recursively
-(void)printNode:(LinkedListNode *)node{
    
    if (node.next == nil) {
        MDLog(@"%@", [node.object description]);
        MDLog(@"----------");
    }else{
        MDLog(@"%@", [node.object description]);
        MDLog(@" | ");
        MDLog(@" | ");
        MDLog(@"----------");
        [self printNode:node.next];
    }
}

@end
