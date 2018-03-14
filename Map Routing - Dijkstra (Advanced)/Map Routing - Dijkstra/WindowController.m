//
//  WindowController.m
//  Map Routing - Dijkstra
//
//  Created by Yongyang Nie on 1/19/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    NSRect frame = [self.window frame];
    frame.origin.y -= frame.size.height; // remove the old height
    frame.origin.y += 960; // add the new height
    frame.size = CGSizeMake(960, 720);
    [self.window setFrame:frame display:YES animate:YES];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
