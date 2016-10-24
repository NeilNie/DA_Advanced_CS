
//
//  AddFriendTableViewController.m
//  FriendList
//
//  Created by Yongyang Nie on 10/19/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "AddFriendViewController.h"

@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != self.currentPersonIndex) {
        [self.delegate addFriend:[self.world nodeAt:(int)indexPath.row].object];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.world count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idPerson" forIndexPath:indexPath];
    if (indexPath.row != self.currentPersonIndex) {
        Person *person = [self.world nodeAt:(int)indexPath.row].object;
        cell.textLabel.text = person.name;
    }
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
