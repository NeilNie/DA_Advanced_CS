//
//  LinkList.h
//  Linked_List
//
//  Created by Yongyang Nie on 10/10/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject

@property (nonatomic, strong) id object;
@property (nonatomic, weak) LinkedListNode *previous;
@property (nonatomic, strong) LinkedListNode *next;

- (instancetype)initWithObject:(id)object;

@end
