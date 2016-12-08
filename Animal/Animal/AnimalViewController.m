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

-(IBAction)submit:(id)sender{
    
    //!Answer is YES !//
    if ([self.userInput.stringValue isEqualToString:@"Yes"]) {
        
        if (self.currentNode.leftChild){
            self.currentNode = self.currentNode.leftChild;
            self.response.string =  [self.response.string stringByAppendingString:[NSString stringWithFormat:@"%@?\n", self.currentNode.value]];
        }
        else if (isQ && !self.currentNode.leftChild){ //got it!
            self.response.string = [self.response.string stringByAppendingString:[NSString stringWithFormat:@"Yeah, %@\n", self.currentNode.value]];
        }
    
    //!Answer is No !//
    }else if ([self.userInput.stringValue isEqualToString:@"No"]){
        if(self.currentNode.rightChild){
            self.currentNode = self.currentNode.rightChild;
            self.response.string =  [self.response.string stringByAppendingString:[NSString stringWithFormat:@"%@?\n", self.currentNode.value]];
            isQ = YES;
        }else{
            self.response.string = [self.response.string stringByAppendingString:@"I don't know your animal, what is it?\n"];
        }
        
    //!Input knowledge!//
    }else{
        if ([self.userInput.stringValue containsString:@"It is"]) {
            self.response.string = [self.response.string stringByAppendingString:
                                    [NSString stringWithFormat:@"What's a difference between %@ and%@\n",
                                     [self.currentNode.value stringByReplacingOccurrencesOfString:@"It is" withString:@""],
                                     [self.userInput.stringValue stringByReplacingOccurrencesOfString:@"It is" withString:@""]]];
            addedA = self.userInput.stringValue;
        }else if ([self.userInput.stringValue containsString:@"It"]) {
            self.currentNode.rightChild = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:self.userInput.stringValue];
            self.currentNode.rightChild.leftChild = [[TreeNode alloc] initWithLeftChild:nil rightChild:nil value:addedA];
            self.response.string = [self.response.string stringByAppendingString:@"Now I know"];
        }
    }
}

-(IBAction)restart:(id)sender{
    self.currentNode = self.tree.root;
    self.userInput.stringValue = @"";
    self.response.string = [NSString stringWithFormat:@"%@?\n", self.currentNode.value];
    isQ = YES;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tree = [[BST alloc] initWithFileName:[[NSBundle mainBundle] pathForResource:@"learning" ofType:@"txt"]];
    [self.tree buildTree];
    self.currentNode = self.tree.root;
    self.response.string = [self.response.string stringByAppendingString:[NSString stringWithFormat:@"%@?\n", self.currentNode.value]];
    isQ = YES;
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
