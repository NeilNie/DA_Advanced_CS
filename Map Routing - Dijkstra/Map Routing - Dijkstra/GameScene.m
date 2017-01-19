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
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)sceneDidLoad {
    
    SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"map.png"];
    sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:sn];
    
    self.backgroundColor = [NSColor whiteColor];
}


- (void)touchDownAtPoint:(CGPoint)pos {

}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)keyDown:(NSEvent *)theEvent {

}

- (void)mouseDown:(NSEvent *)theEvent {

}
- (void)mouseDragged:(NSEvent *)theEvent {

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
