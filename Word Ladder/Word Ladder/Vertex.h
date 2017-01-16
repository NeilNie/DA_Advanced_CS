//
//  Vertex.h
//  Word Ladder
//
//  Created by Yongyang Nie on 1/15/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum VertexState{
    StateUndiscovered = 0,
    StateDiscovered,
    StateFinalized
} VertexState;

@interface Vertex : NSObject

@property int distance;
@property VertexState state;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) Vertex *predecessor;
@property (nonatomic, strong) NSMutableArray *connections;

- (instancetype)initWithKey:(NSString *)key;

@end
