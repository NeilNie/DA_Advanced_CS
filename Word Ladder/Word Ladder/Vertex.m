//
//  Vertex.m
//  Word Ladder
//
//  Created by Yongyang Nie on 1/11/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

#pragma mark - Constructor

- (instancetype)initWithKey:(NSString *)key
{
    self = [super init];
    if (self) {
        self.key = key;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"key: %@ \n connections: %@", self.key, self.connected];
}


@end
