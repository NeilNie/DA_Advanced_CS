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

-(void)method{
    
    //1
    NSDictionary *d = @{@"Key": @98};
    
    //2
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //[dic set]
}

#pragma mark - IBAction

-(IBAction)action:(id)sender{
    [self search:self.startInput.stringValue target:self.targetInput.stringValue];
}
- (IBAction)clear:(id)sender {
    self.allWords = [self retreiveWordsLocal];
    self.graph = [self buildGraph];
    self.targetInput.stringValue = @"";
    self.startInput.stringValue = @"";
}

#pragma mark - Private Helpers

-(NSMutableArray *)retreiveWordsLocal{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"four_letter_words" ofType:@"txt"];
    NSArray* allLinedStrings = [[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return [NSMutableArray arrayWithArray:allLinedStrings];
}

-(NSMutableArray *)retreiveFourLetterWords{
    
    NSString *stringFromFileAtURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/dwyl/english-words/master/words2.txt"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *masterArray = [stringFromFileAtURL componentsSeparatedByString:@"\n"];
    
    NSMutableArray *wordsArray = [NSMutableArray array];
    
    for (NSString *str in masterArray)
        if ([str length] == 4)
            [wordsArray addObject:str];
    return wordsArray;
}

-(void)saveToFile:(NSString *)content{
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"/Users/Neil/maps.txt"];
    
    [content writeToFile:fileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
}

#pragma mark - Public Methods

-(Graph *)buildGraph:(NSString *)word{
    
    Graph *graph = [[Graph alloc] init];
    NSMutableArray *buckets = [NSMutableArray array];
    
    for (int i = 0; i < word.length; i++) {
        
        NSMutableArray *bucket = [NSMutableArray array];
        
        for (NSString *string in self.allWords) {
            
            if ([string containsString:[word substringFromIndex:i+1]] && i == 0)
                [bucket addObject:string];
            
            else if ([[string substringFromIndex:i+1] isEqualToString:[word substringFromIndex:i+1]] &&
                     [[string substringToIndex:i] isEqualToString:[word substringToIndex:i]] &&
                     ![string isEqualToString:word])
                [bucket addObject:string];
            
        }
        if (bucket.count >= 1)
            [buckets addObject:bucket];
        
    }
    NSLog(@"%@", buckets);
    return graph;
}

-(void)search:(NSString *)start target:(NSString *)target{

    NSDate *method2Start = [NSDate date];
    
    Vertex *startVertex = [self.graph getVertex:start];
    Queue *vertQueue = [[Queue alloc] init];
    [vertQueue enqueue:startVertex];
    
    while (vertQueue.count > 0){
        
        Vertex *currentVert = [vertQueue dequeue];
        
        for (NSString *nbr in currentVert.connections){
            Vertex *v = [self.graph getVertex:nbr];
            if ([v state] == StateUndiscovered){
                v.state = StateDiscovered;
                v.distance = currentVert.distance + 1;
                v.predecessor = currentVert;
                [vertQueue enqueue:v];
            }
        }
        currentVert.state = StateFinalized;
    }
    
    NSDate *method2Finish = [NSDate date];
    NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
    NSLog(@"method time: %f", executionTime2);

    [self traverse:[self.graph getVertex:target]];
}

-(void)traverse:(Vertex *)v{
    
    NSMutableArray *array = [NSMutableArray array];
    Vertex *x = v;
    while (x.predecessor){
        [array addObject:x.key];
        NSLog(@"%@", x.key);
        x = x.predecessor;
    }
    self.textView.string = [[array valueForKey:@"description"] componentsJoinedByString:@"\n"];
}

-(Graph *)buildGraph{
    
    NSDate *method2Start = [NSDate date];
    
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    Graph *g = [[Graph alloc] init];
    // create buckets of words that differ by one letter
    for (NSString *word in self.allWords){
        
        for (int i = 0; i < word.length; i++) {
            NSString *bucket = [NSString stringWithFormat:@"%@_%@", [word substringToIndex:i], [word substringFromIndex:i+1]];
            
            if ([d objectForKey:bucket])
                [(NSMutableArray *)[d objectForKey:bucket] addObject:word];
            else
                [d setObject:[[NSMutableArray alloc] initWithObjects:word, nil] forKey:bucket];
        }
    }
    NSLog(@"%@", d);
    
    for (NSString *bucket in [d allKeys]) {
        for (NSString *word1 in d[bucket])
            for (NSString *word2 in d[bucket])
                if (![word1 isEqualToString:word2])
                    [g addEdge:word1 toVert:word2];

    }

    NSLog(@"%@", g.adjacencyList);
    
    NSDate *method2Finish = [NSDate date];
    NSTimeInterval executionTime2 = [method2Finish timeIntervalSinceDate:method2Start];
    NSLog(@"method time: %f", executionTime2);
    
    return g;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allWords = [self retreiveWordsLocal];
    [self saveToFile:[[self.allWords valueForKey:@"description"] componentsJoinedByString:@"\n"]];
    self.graph = [self buildGraph];
    // Do view setup here.
}

@end
