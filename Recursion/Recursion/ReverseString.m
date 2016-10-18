//
//  ReverseString.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 9/30/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ReverseString.h"

@implementation ReverseString

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reverse = @" ";
    }
    return self;
}

-(void)reverseString:(NSString *)string{
    
    if ([string length] == 1) {
        self.reverse = [self.reverse stringByAppendingString:string];
    }
    else{
        NSString *s = [string substringFromIndex:[string length] - 1];
        self.reverse = [self.reverse stringByAppendingString:s];
        string = [string stringByReplacingOccurrencesOfString:s withString:@""];
        
        [self reverseString:string];
    }
}

@end
