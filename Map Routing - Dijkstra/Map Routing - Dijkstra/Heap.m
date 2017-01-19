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
    Vertex *child = [self.array objectAtIndex:childIndex];
    int parentIndex = [self parentIndex:childIndex]; //calculate the parent index
    
    while (childIndex > 0 && child.cost < [(Vertex *)[self.array objectAtIndex:parentIndex] cost]) {
        
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
        if (leftChildIndex < self.array.count && [(Vertex *)[self.array objectAtIndex:leftChildIndex] cost] < [(Vertex *)[self.array objectAtIndex:first] cost])
            first = leftChildIndex;

        if (rightChildIndex < self.array.count && [(Vertex *)[self.array objectAtIndex:rightChildIndex] cost] <  [(Vertex *)[self.array objectAtIndex:first] cost])
            first = rightChildIndex;

        if (first == parentIndex)
            return;
        
        [self.array exchangeObjectAtIndex:parentIndex withObjectAtIndex:first];
        parentIndex = first;
    }
}

-(void)heapify{
    [self heapify:0 heapSize:self.array.count];
}


//Adds the new element to the end of the heap and then uses shiftUp() to fix the heap.
-(void)insert:(Vertex *)object{
    [self.array addObject:object];
    [self shiftUp:(int)self.array.count - 1];
}


/**Removes and returns the maximum value (max-heap) or the minimum value (min-heap). 
 To fill up the hole that's left by removing the element, the very last element is moved to the root position 
 and then shiftDown() fixes up the heap. (This is sometimes called "extract min" or "extract max".)
 **/
-(Vertex *)remove{
    
    if (self.array.count == 0)
        return nil;
    else if (self.array.count == 1){
        Vertex *v = [self.array lastObject];
        [self.array removeLastObject];
        return v;
    }
    else {
        Vertex *v = [self.array objectAtIndex:0];
        [self.array replaceObjectAtIndex:0 withObject:[self.array objectAtIndex:self.array.count - 1]];
        [self.array removeLastObject];
        [self heapify];
        return v;
    }
}

//Just like remove() except it lets you remove any item from the heap, not just the root. This calls both shiftDown(), in case the new element is out-of-order with its children, and shiftUp(), in case the element is out-of-order with its parents.
-(Vertex *)removeAt:(int)index{
    
    if (index > self.array.count - 1)
        return nil;
    
    int size = (int)self.array.count - 1;
    if (index != size) {
        [self.array exchangeObjectAtIndex:size withObjectAtIndex:index];
        [self heapify:index heapSize:(NSUInteger)size];
        [self shiftUp:index];
    }
    Vertex *n = [self.array lastObject];
    [self.array removeLastObject];
    return n;
}


//Assigns a smaller (min-heap) or larger (max-heap) value to a node. Because this invalidates the heap property, it uses shiftUp() to patch things up. (Also called "decrease key" and "increase key".)
-(void)replace:(NSString *)key withValue:(Vertex *)value{
    
}

//Heaps aren't built for efficient searches but the replace() and removeAtIndex() operations require the array index of the node, so you need to find that index somehow. Time: O(n).
-(Vertex *)search:(NSString *)key{
    return [self.nodes objectForKey:key];
}

-(Vertex *)peek{
    return self.array.firstObject;
}

-(void)print{
    NSLog(@"%@", self.array);
}

-(BOOL)isEmpty{
    return self.array.count == 0;
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

#pragma mark - Override

-(NSString *)description{
    return [self.array description];
}

@end
