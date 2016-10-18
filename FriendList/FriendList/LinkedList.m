//
//  LinkListNode.m
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "LinkedList.h"

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
    
    int count = 0;
    if (self.head) {
        count++;
        LinkedListNode *node = self.head;
        while (node.next != nil) {
            count++;
            node = node.next;
        }
    }
    return count;
}

//return two nodes before and after a index
-(NodesBA)nodeBeforeAfter:(int)index{
    
    if (index >= 0) {
        
        struct NodesBA nodesba;
        int c = 0;
        LinkedListNode *before = [[LinkedListNode alloc] init];
        LinkedListNode *after = self.head;
        while (c < index && c < [self count]) {
            c ++;
            before = after;
            after = after.next;
        }
        nodesba.before = before;
        nodesba.after = after;
        
        return nodesba;
    }
    @throw [NSException exceptionWithName:@"Linked List Out of Bounds" reason:@"index < 0 || index > LinkedList upperbound" userInfo:nil];
}

-(void)insert:(id)object atIndex:(int)index{
    
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
    NSLog(@"%@", newNode.object);
}

//clear all objects in linked list recursively.
-(void)clear{
    
    self.head = nil;
}
-(void)print{
    [self printNode:self.head];
}

-(void)removeAt:(int)index{
    
    LinkedListNode *node = [self nodeAt:index];
    node.previous.next = node.next;
    node.next.previous = node.previous;
    node = nil;
}

#pragma mark - Helpers (mainly recursive methods)

-(LinkedListNode *)nextNode:(LinkedListNode *)node{
    
    static int i;
    if (node.next == nil) {
        return nil;
    }else{
        i++;
        return [self nextNode:node.next];
    }
}

//return a node at a certain index
-(LinkedListNode *)nodeAt:(int)index{
    
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
    
    if (node == [self last]) {
        NSLog(@"%@", node.object);
        NSLog(@"|");
        NSLog(@"nil");
    }else{
        NSLog(@"%@", node.object);
        NSLog(@"|");
        [self printNode:node.next];
    }
}

@end
