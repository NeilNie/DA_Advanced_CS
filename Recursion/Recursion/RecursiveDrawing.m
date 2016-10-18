//
//  RecursiveDrawing.m
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "RecursiveDrawing.h"

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

@implementation RecursiveDrawing

//http://stackoverflow.com/questions/28442516/ios-an-easy-way-to-draw-a-circle-using-cashapelayer

-(void)drawTreeStart:(CGPoint)start length:(float)length angle:(float)angle{
    
    if (length > 5) {
        
        CGPoint end = CGPointMake(start.x + length * cosf(DEGREES_TO_RADIANS(angle)), start.y - length * sinf(DEGREES_TO_RADIANS(angle)));
        
        UIBezierPath *path1 = [UIBezierPath bezierPath];
        [path1 moveToPoint:CGPointMake(start.x, start.y)];
        [path1 addLineToPoint:CGPointMake(end.x, end.y)];
        CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
        shapeLayer1.path = [path1 CGPath];
        shapeLayer1.strokeColor = [[UIColor blackColor] CGColor];
        shapeLayer1.lineWidth = 3.0;
        shapeLayer1.fillColor = [[UIColor clearColor] CGColor];
        [self.delegate addSubLayerToMainView:shapeLayer1];
        
        [self drawTreeStart:CGPointMake(end.x, end.y) length:length * 2.0/3.0 angle:angle - 60.0];
        [self drawTreeStart:CGPointMake(end.x, end.y) length:length * 3.0/4.0 angle:angle + 30.0];
    }
}


-(void)drawCircle:(int)radis withX:(int)x withY:(int)y{
    
    if ([self distance:x y1:y x2:abs(x + radis * 3/5) y2:abs(y - radis * 3/5)] < 5) {
        return;
    }else{
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, radis, radis)] CGPath]];
        [self.delegate addSubLayerToMainView:circleLayer];
        
        [self drawCircle:radis - (radis * 2/4) withX:x - radis * 6/7 withY:y - radis * 6/7];
        [self drawCircle:radis - (radis * 2/4) withX:x - radis * 6/7 withY:y + radis * 6/7];
        
        [self drawCircle:radis - (radis * 2/4) withX:x + radis * 6/7 withY:y - radis * 6/7];
        [self drawCircle:radis - (radis * 2/4) withX:x + radis * 6/7 withY:y + radis * 6/7];
    }
}

-(float)distance:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2{
    
    return sqrt(pow((x1 - x2), 2.0) + pow((y1 - y2), 2.0));
}

-(void)drawTree:(int)length direction:(int)d start:(int)start end:(int)end{
    
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(300, 300)];
    [linePath addLineToPoint:CGPointMake(100, 100)];
    line.lineWidth = 10.0;
    line.path = linePath.CGPath;
    line.fillColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    line.strokeColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    
    [self.delegate addSubLayerToMainView:line];
}

@end
