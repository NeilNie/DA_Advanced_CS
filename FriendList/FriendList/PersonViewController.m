//
//  PersonViewController.m
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

#pragma mark - AddFriend ViewController Delegate

-(void)addFriend:(Person *)person{

    if (![self checkDuplicateFriends:person]) {
        [self.person.friends addObject:person];
        [self.tableView reloadData];
    }
}

-(BOOL)checkDuplicateFriends:(Person *)friend{
    
    for (int i = 0; i < [self.person.friends count]; i++) {
        Person *person = [self.person.friends nodeAt:i].object;
        if ([person.name isEqualToString:friend.name]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - UITableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellFriends" forIndexPath:indexPath];
    Person *person = [self.person.friends nodeAt:(int)indexPath.row].object;
    cell.textLabel.text = person.name;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.person.friends count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", [self.person.friends nodeAt:(int)indexPath.row].object);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.person.friends removeAt:(int)indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.nameTitle.title = [(Person *)[self.theWorld nodeAt:(int)self.personIndex].object name];
    self.person = [self.theWorld nodeAt:(int)self.personIndex].object;
    self.detailLabel.text = [NSString stringWithFormat:@"You can see %@'s friends, remove friends and add friends", self.person.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"idAddFriend"]) {
        AddFriendViewController *controller = (AddFriendViewController *)[segue destinationViewController];
        controller.currentPersonIndex  = self.personIndex;
        controller.delegate = self;
        [controller setWorld:self.theWorld];
    }
}

@end
