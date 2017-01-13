//
//  Vertex.h
//  Word Ladder
//
//  Created by Yongyang Nie on 1/11/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vertex : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSMutableArray *connected;

//-(void)addNeighbor:(Vertex *)neighbor weight:(Vertex *)weight;

- (instancetype)initWithKey:(NSString *)key;

@end
