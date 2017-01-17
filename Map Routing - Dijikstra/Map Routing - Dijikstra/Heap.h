//
//  Heap.h
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heap : NSObject

@property NSUInteger count;

@property BOOL isEmpty;

- (instancetype)initWithObjects:(NSArray *)objects;

//If the element is greater (max-heap) or smaller (min-heap) than its parent, it needs to be swapped with the parent. This makes it move up the tree
-(void)shiftUp:(int)n;

//If the element is smaller (max-heap) or greater (min-heap) than its children, it needs to move down the tree. This operation is also called "heapify".
-(void)heapify:(int)index heapSize:(NSUInteger)size;

-(void)heapify;

-(int)peek;

-(void)print;

//Adds the new element to the end of the heap and then uses shiftUp() to fix the heap.
-(void)insert:(int)object;

//Removes and returns the maximum value (max-heap) or the minimum value (min-heap). To fill up the hole that's left by removing the element, the very last element is moved to the root position and then shiftDown() fixes up the heap. (This is sometimes called "extract min" or "extract max".)
-(int)remove;

//Just like remove() except it lets you remove any item from the heap, not just the root. This calls both shiftDown(), in case the new element is out-of-order with its children, and shiftUp(), in case the element is out-of-order with its parents.
-(int)removeAt:(int)index;

//Assigns a smaller (min-heap) or larger (max-heap) value to a node. Because this invalidates the heap property, it uses shiftUp() to patch things up. (Also called "decrease key" and "increase key".)
-(void)replace:(int)index withValue:(int)value;

//Heaps aren't built for efficient searches but the replace() and removeAtIndex() operations require the array index of the node, so you need to find that index somehow. Time: O(n).
-(int)search:(int)n;

//Converts an (unsorted) array into a heap by repeatedly calling insert(). If you’re smart about this, it can be done in O(n) time.
//-(NSMutableArray *)buildHeap:(NSArray *)array;

@end
