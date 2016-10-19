//
//  ViewController.m
//  FriendList
//
//  Created by Yongyang Nie on 10/14/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

#pragma mark - UITableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idTableCell" forIndexPath:indexPath];
    Person *person = [self.people nodeAt:(int)indexPath.row].object;
    cell.textLabel.text = person.name;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.people count];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0;
}

#pragma mark - AddPerson Delegate

-(void)addPersonWithName:(NSString *)string{
    
    Person *person = [[Person alloc] initWithName:string];
    [self.people addObject:person];
    [self.tableView reloadData];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    self.people = [[LinkedList alloc] init];
    Person *person = [[Person alloc] initWithName:@"Neil"];
    [self.people addObject:person];
    Person *person2 = [[Person alloc] initWithName:@"Joseph"];
    [self.people addObject:person2];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"segueAddPerson"]) {
        AddPersonViewController *controller = [segue destinationViewController];
        controller.delegate = self;
    }
}

@end
