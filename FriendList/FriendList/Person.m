//
//  Person.m
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)string
{
    self = [super init];
    if (self) {
        self.name = string;
        self.friends = [[LinkedList alloc] init];
    }
    return self;
}

@end
