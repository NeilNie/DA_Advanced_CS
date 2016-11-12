//
//  GameScene.m
//  Maze
//
//  Created by Yongyang Nie on 11/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
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
    switch (theEvent.keyCode) {
        case 0x31 /* SPACE */:
            // Run 'Pulse' action from 'Actions.sks'
            break;
            
        default:
            NSLog(@"keyDown:'%@' keyCode: 0x%02X", theEvent.characters, theEvent.keyCode);
            break;
    }
}

- (void)mouseDown:(NSEvent *)theEvent {
    
}
- (void)mouseDragged:(NSEvent *)theEvent {
    
}
- (void)mouseUp:(NSEvent *)theEvent {
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    // Called before each frame is rendered
}

@end
