//
//  Stack.h
//  Maze
//
//  Created by Yongyang Nie on 10/28/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "LinkedList.h"

@interface Stack : LinkedList

-(void)push:(id)object;

-(void)pop;

-(id)peek;

-(BOOL)isEmpty;

@end
