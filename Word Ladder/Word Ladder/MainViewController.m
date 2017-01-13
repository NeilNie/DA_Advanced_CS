//
//  ViewController.m
//  
//
//  Created by Yongyang Nie on 1/11/17.
//
//

#import "MainViewController.h"
#import "Graph.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(NSMutableArray *)retreiveFourLetterWords{
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:[NSURL URLWithString:@"http://web.stanford.edu/class/cs106l/assignments/dictionary.txt"]
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    NSArray *masterArray = [stringFromFileAtURL componentsSeparatedByString:@"\n"];
    NSMutableArray *wordsArray = [NSMutableArray array];
    for (NSString *str in masterArray)
        if ([str length] == 4)
            [wordsArray addObject:str];
    return wordsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hello world");
    
    Graph *graph = [[Graph alloc] init];
    [graph addVertex:@"Fool"];
    [graph addVertex:@"Pool"];
    [graph addVertex:@"Five"];
    [graph addVertex:@"Fine"];
    NSLog(@"%@", graph.adjacencyList);
    [graph addEdge:@"Fool" toVert:@"Pool"];
    NSLog(@"%@", graph.adjacencyList);
    // Do view setup here.
}

@end
