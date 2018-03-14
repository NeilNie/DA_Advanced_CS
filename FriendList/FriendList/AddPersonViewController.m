//
//  AddPersonViewController.m
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController

-(IBAction)addPerson:(id)sender{
    
    [self.delegate addPersonWithName:self.textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
