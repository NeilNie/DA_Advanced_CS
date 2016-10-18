//
//  RecursiveDrawing.h
//  Recursion_HW
//
//  Created by Yongyang Nie on 10/1/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface RecursiveDrawing : NSObject

@property (retain, nonatomic) id delegate;

-(void)drawCircle:(int)radis withX:(int)x withY:(int)y;
-(void)drawTreeStart:(CGPoint)start length:(float)length angle:(float)angle;

@end

@protocol RecursiveDrawingDelegate <NSObject>

-(void)addSubLayerToMainView:(CAShapeLayer *)layer;

@end
