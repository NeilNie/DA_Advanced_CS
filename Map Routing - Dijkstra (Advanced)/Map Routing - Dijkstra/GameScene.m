//
//  GameScene.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/18/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    NSTimeInterval _lastUpdateTime;
}

- (void)sceneDidLoad {
    
    SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"map2.png"];
    sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:sn];
    
    self.backgroundColor = [NSColor whiteColor];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    [self.sceneDelegate setLocation:pos.x y:pos.y];
    NSLog(@"point %f : %f", pos.x, pos.y);
}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)mouseDown:(NSEvent *)theEvent {
    
    [self touchDownAtPoint:[theEvent locationInNode:self]];
}
- (void)mouseUp:(NSEvent *)theEvent {

}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    
    // Initialize _lastUpdateTime if it has not already been
    if (_lastUpdateTime == 0) {
        _lastUpdateTime = currentTime;
    }
    
    // Calculate time since last update
    CGFloat dt = currentTime - _lastUpdateTime;
    
    // Update entities
    for (GKEntity *entity in self.entities) {
        [entity updateWithDeltaTime:dt];
    }
    
    _lastUpdateTime = currentTime;
}

@end
