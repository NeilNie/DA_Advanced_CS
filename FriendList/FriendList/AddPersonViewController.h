//
//  AddPersonViewController.h
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPersonViewController : UIViewController

@property (retain, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@protocol AddPersonViewControllerDelegate <NSObject>

-(void)addPersonWithName:(NSString *)string;

@end
