//
//  PrintBinary.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 9/30/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "PrintBinary.h"

@implementation PrintBinary

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.binary = @"";
    }
    return self;
}

-(void)PrintInBinary:(int)x{
    
    if (x <= 1){
        self.binary = [[NSMutableString stringWithFormat:@"%d", x] stringByAppendingString:self.binary];
        NSLog(@"%d", x);
    }else{
        self.binary = [[NSMutableString stringWithFormat:@"%d", x%2] stringByAppendingString:self.binary];
        [self PrintInBinary:x / 2];
    }
}

@end
