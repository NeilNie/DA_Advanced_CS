//
//  LinkList.m
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

- (instancetype)initWithObject:(id)object{
    
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

@end
