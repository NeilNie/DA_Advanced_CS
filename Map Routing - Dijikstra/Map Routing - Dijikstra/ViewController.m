//
//  ViewController.m
//  Map Routing - Dijikstra
//
//  Created by Yongyang Nie on 1/16/17.
//  Copyright © 2017 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"
#import "Heap.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Heap *heap = [[Heap alloc] initWithObjects:@[@8, @7, @1, @3, @9, @4, @5]];
    [heap print];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
