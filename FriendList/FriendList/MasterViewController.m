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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
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
    Person *person3 = [[Person alloc] initWithName:@"Neil"];
    [self.people addObject:person3];
    Person *person4 = [[Person alloc] initWithName:@"Joseph"];
    [self.people addObject:person4];
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
    }else if ([segue.identifier isEqualToString:@"idShowPerson"]){
        PersonViewController *vc = [segue destinationViewController];
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        vc.personIndex = index.row;
        vc.theWorld = self.people;
    }
}

@end
