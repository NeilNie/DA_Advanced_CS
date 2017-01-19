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
    // Setup your scene here
    
    // Initialize update time
    _lastUpdateTime = 0;
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
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
