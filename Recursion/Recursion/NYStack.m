//
//  NYStack.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/5/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "NYStack.h"

@interface NYStack ()

@property (nonatomic, strong) NSMutableArray *objects;

@end

@implementation NYStack

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSUInteger)count{
    return _objects.count;
}

-(id)initWithArray:(NSArray*)array{
    
    self = [super init];
    
    if (self = [super init]) {
        self.objects = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}

-(void)pushObject:(id)object{
    
    [self.objects addObject:object];
}

-(void)pushObjects:(NSArray*)objects{
    
    [self.objects addObjectsFromArray:objects];
}

-(id)popObject{
    
    if (self.objects.count > 0) {
        id object = [self.objects lastObject];
        [self.objects removeObject:self.objects.lastObject];
        return object;
    }
    @throw [NSException exceptionWithName:@"Stack overflow" reason:@"Array length <= 0" userInfo:nil];
    return nil;
}

-(id)peekObject{
    
    if (self.objects.count > 0) {
        id object = [self.objects lastObject];
        return object;
    }
    @throw [NSException exceptionWithName:@"Stack overflow" reason:@"Array length <= 0" userInfo:nil];
    return nil;
}

#pragma mark - NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len {
    return [_objects countByEnumeratingWithState:state objects:buffer count:len];
}

@end
