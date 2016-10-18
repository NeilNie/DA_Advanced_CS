//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by Yongyang Nie on 9/23/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"
#import "FractionCalculator.h"
#import "Fraction.h"

@interface ViewController : UIViewController <FractionDelegate>{

    NSString *Operator;
}

@property (strong, nonatomic) FractionCalculator *calculator;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *display;

-(IBAction)NumberPressed:(id)sender;
-(IBAction)OperationPressed:(id)sender;

@end

