//
//  ViewController.h
//  
//
//  Created by Yongyang Nie on 1/11/17.
//
//

#import <Cocoa/Cocoa.h>
#import <malloc/malloc.h>
#import "Graph.h"
#import "Vertex.h"
#import "Queue.h"

@interface MainViewController : NSViewController

@property (strong, nonatomic) NSMutableArray *allWords;
@property (strong, nonatomic) Graph *graph;

@property (nonatomic, weak) IBOutlet NSTextView *textView;
@property (nonatomic, weak) IBOutlet NSTextField *startInput;
@property (nonatomic, weak) IBOutlet NSTextField *targetInput;

@end
