//
//  Person.h
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) LinkedList *friends;

- (instancetype)initWithName:(NSString *)string;

@end
