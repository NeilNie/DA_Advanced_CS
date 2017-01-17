//
//  Heap.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Heap.h"

@interface Heap ()

@property (strong, nonatomic) NSMutableArray *array;

@property (strong, nonatomic) NSMutableDictionary *nodes;

@end

@implementation Heap

#pragma mark - Constructors

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects
{
    self = [super init];
    if (self) {
        
        //Floyd's algorithm O(n)
        self.array = [NSMutableArray arrayWithArray:objects];
        for (int i = 0; i < (int)objects.count / 2; i++)
            [self heapify:i heapSize:self.array.count];
    }
    return self;
}

#pragma mark - Public Methods

/**
 * Takes a child node and looks at its parents; if a parent is not larger
 * (max-heap) or not smaller (min-heap) than the child, we exchange them.
**/
-(void)shiftUp:(int)n{
    
    int childIndex = n;
    NSNumber *child = [self.array objectAtIndex:childIndex];
    int parentIndex = [self parentIndex:childIndex]; //calculate the parent index
    
    while (childIndex > 0 && [child intValue] < [[self.array objectAtIndex:parentIndex] intValue]) {
        
        //replace item at childIndex with item at parent index.
        [self.array replaceObjectAtIndex:childIndex withObject:[self.array objectAtIndex:parentIndex]];
        childIndex = parentIndex;
        parentIndex = [self parentIndex:childIndex];
    }
    [self.array replaceObjectAtIndex:childIndex withObject:child];
}

-(void)heapify:(int)index heapSize:(NSUInteger)size{
    
    int parentIndex = index;
    
    while (true) {
        int leftChildIndex = [self leftChildIndex:parentIndex];
        int rightChildIndex = leftChildIndex + 1;
        
        // Figure out which comes first if we order them by the sort function: the parent, the left child, or the right child.
        //If the parent comes first, we're done. If not, that element is out-of-place and we make it "float down" the tree until the heap property is restored.
        int first = parentIndex;
        if (leftChildIndex < self.array.count && [[self.array objectAtIndex:leftChildIndex] intValue] < [[self.array objectAtIndex:first] intValue]) {
            first = leftChildIndex;
        }
        if (rightChildIndex < self.array.count && [[self.array objectAtIndex:rightChildIndex] intValue] <  [[self.array objectAtIndex:first] intValue]) {
            first = rightChildIndex;
        }
        if (first == parentIndex) {
            return;
        }
        [self.array exchangeObjectAtIndex:parentIndex withObjectAtIndex:first];
        parentIndex = first;
    }
}

-(void)heapify{
    [self heapify:0 heapSize:self.array.count];
}


//Adds the new element to the end of the heap and then uses shiftUp() to fix the heap.
-(void)insert:(int)object{
    [self.array addObject:[NSNumber numberWithInt:object]];
    [self shiftUp:(int)self.array.count - 1];
}


/**Removes and returns the maximum value (max-heap) or the minimum value (min-heap). 
 To fill up the hole that's left by removing the element, the very last element is moved to the root position 
 and then shiftDown() fixes up the heap. (This is sometimes called "extract min" or "extract max".)
 **/
-(int)remove{
    
    if (self.array.count == 0)
        return -1;
    else if (self.array.count == 1)
        return [[self.array lastObject] intValue];
    else {
        int value = [[self.array objectAtIndex:0] intValue];
        [self.array insertObject:[self.array objectAtIndex:self.array.count - 1] atIndex:0];
        [self.array removeLastObject];
        [self heapify];
        return value;
    }
}

//Just like remove() except it lets you remove any item from the heap, not just the root. This calls both shiftDown(), in case the new element is out-of-order with its children, and shiftUp(), in case the element is out-of-order with its parents.
-(int)removeAt:(int)index{
    
    if (index > self.array.count - 1)
        return -1;
    
    int size = (int)self.array.count - 1;
    if (index != size) {
        [self.array exchangeObjectAtIndex:size withObjectAtIndex:index];
        [self heapify:index heapSize:(NSUInteger)size];
        [self shiftUp:index];
    }
    NSNumber *n = [self.array lastObject];
    [self.array removeLastObject];
    return [n intValue];
}


//Assigns a smaller (min-heap) or larger (max-heap) value to a node. Because this invalidates the heap property, it uses shiftUp() to patch things up. (Also called "decrease key" and "increase key".)
-(void)replace:(int)index withValue:(int)value{
    
}

//Heaps aren't built for efficient searches but the replace() and removeAtIndex() operations require the array index of the node, so you need to find that index somehow. Time: O(n).
-(int)search:(int)n{
    return 0;
}

-(int)peek{
    return 0;
}

-(void)print{
    NSLog(@"%@", self.array);
}

#pragma mark - Private Helpers

-(int)parentIndex:(int)i{
    return (i - 1) / 2;
}

/**
 * Note that this index can be greater than the heap size, in which case there is no left child.
 */
-(int)leftChildIndex:(int)i{
    return 2*i + 1;
}

/**
 * Note that this index can be greater than the heap size, in which case there is no right child.
 */
-(int)rightChildIndex:(int)i{
    return 2*i + 2;
}

@end
