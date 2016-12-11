//
//  ViewController.m
//  Animal
//
//  Created by Yongyang Nie on 12/6/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

//Left is true, right is false

#import "AnimalViewController.h"

@interface AnimalViewController () {
    BOOL isQ;
    NSString *addedQ;
    NSString *addedA;
}

@end

@implementation AnimalViewController

-(IBAction)yesClick:(id)sender{
    
    if (self.currentNode.leftChild){
        self.currentNode = self.currentNode.leftChild;
        self.response.string =  [self.response.string stringByAppendingString:[NSString stringWithFormat:@"Is it %@?\n", self.currentNode.value]];
    }
    else if (isQ && !self.currentNode.leftChild){ //got it!
        self.response.string = [self.response.string stringByAppendingString:[NSString stringWithFormat:@"Yeah, It is %@\n", self.currentNode.value]];
    }
}

-(IBAction)noClick:(id)sender{
    
    if(self.currentNode.rightChild){
        self.currentNode = self.currentNode.rightChild;
        self.response.string =  [self.response.string stringByAppendingString:[NSString stringWithFormat:@"%@?\n", self.currentNode.value]];
        isQ = YES;
    }else{
        self.response.string = [self.response.string stringByAppendingString:@"I don't know your animal, what is it?\n"];
    }
}

-(IBAction)submit:(id)sender{
    
    if ([self.userInput.stringValue containsString:@"It"]) {
        
        [[RLMRealm defaultRealm] beginWriteTransaction];
        self.currentNode.rightChild = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:self.userInput.stringValue];
        self.currentNode.rightChild.leftChild = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:addedA];
        self.response.string = [self.response.string stringByAppendingString:@"Now I know"];
        [[RLMRealm defaultRealm] commitWriteTransaction];
    
    }else if (![self.userInput.stringValue containsString:@" "]) {
        self.response.string = [self.response.string stringByAppendingString:
                                [NSString stringWithFormat:@"What's a difference between %@ and a %@\n",
                                 self.currentNode.leftChild.value,
                                 self.userInput.stringValue]];
        addedA = self.userInput.stringValue;
    }
}

-(IBAction)restart:(id)sender{
    self.currentNode = (TreeNode *)[[TreeNode allObjects] objectAtIndex:0];
    self.userInput.stringValue = @"";
    self.response.string = [NSString stringWithFormat:@"%@?\n", self.currentNode.value];
    isQ = YES;
}
- (IBAction)clearDatabase:(id)sender {
    
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] deleteAllObjects];
    [[RLMRealm defaultRealm] commitWriteTransaction];
    self.tree = [[BST alloc] initWithFileName:[[NSBundle mainBundle] pathForResource:@"learning" ofType:@"txt"]];
    [self.tree buildTree];
    self.currentNode = self.tree.root;
    self.response.string = [NSString stringWithFormat:@"%@?\n", self.currentNode.value];
    isQ = YES;
    NSLog(@"%@", [[[RLMRealm defaultRealm] configuration] fileURL]);
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.currentNode = (TreeNode *)[[TreeNode allObjects] objectAtIndex:0];
    self.response.string = [self.response.string stringByAppendingString:[NSString stringWithFormat:@"%@?\n", self.currentNode.value]];
    isQ = YES;
    NSLog(@"%@", [[[RLMRealm defaultRealm] configuration] fileURL]);
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
