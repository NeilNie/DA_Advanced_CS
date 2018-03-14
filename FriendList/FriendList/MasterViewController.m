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
    cell.imageView.image = [UIImage imageNamed:@"Circled User Male.png"];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", [self findConnectFriends:(Person *)[self.people nodeAt:(int)indexPath.row].object]);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self removeObjectFromWorld:[self.people nodeAt:(int)indexPath.row].object];
        [self.people removeAt:(int)indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - AddPerson Delegate

-(void)addPersonWithName:(NSString *)string{
    
    Person *person = [[Person alloc] initWithName:string];
    [self.people addObject:person];
    [self.tableView reloadData];
}

#pragma mark - Helper

-(void)removeObjectFromWorld:(Person *)object{
    
    for (int i = 0; i < [self.people count]; i++) {
        
        Person *person = [self.people nodeAt:i].object;
        
        for (int x = 0; x < [person.friends count]; x++) {
            Person *friend = [person.friends nodeAt:x].object;
            if ([friend.name isEqualToString:object.name]) {
                [person.friends removeAt:x];
            }
        }
    }
}

-(BOOL)hasDuplicate:(NSString *)name inArray:(NSMutableArray *)array{
    
    for (int i = 0; i < array.count; i++) {
        if ([name isEqualToString:[array objectAtIndex:i]]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Extension

//this method find all the friend's friend of a person that you selected. 
-(NSMutableArray *)findConnectFriends:(Person *)person{ // withDepth:(int)depth
    
    NSMutableArray *result = [NSMutableArray array];
    LinkedListNode *node = person.friends.head;
    
    //iterate through all of the friends of this person.
    while (node) {
        
        //add the name of the friend to the result array
        [result addObject:[(Person *)node.object name]];
        
        //get this friend's friends
        LinkedList *list = [(Person *)node.object friends];
        LinkedListNode *friendNode = list.head;
        
        //iterate through all of this friend's friend.
        while (friendNode) {
            NSString *name = [(Person *)friendNode.object name];
            
            //if the person we found is not in the list yet add him to the list.
            if (![self hasDuplicate:name inArray:result]) {
                [result addObject:name];
            }
            friendNode = friendNode.next;
        }
        
        node = node.next;
    }
    return result;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    self.people = [[LinkedList alloc] init];
    Person *person = [[Person alloc] initWithName:@"Neil"];
    [self.people addObject:person];
    Person *person2 = [[Person alloc] initWithName:@"Joseph"];
    [self.people addObject:person2];
    Person *person3 = [[Person alloc] initWithName:@"Paul"];
    [self.people addObject:person3];
    Person *person4 = [[Person alloc] initWithName:@"Ben"];
    [self.people addObject:person4];
    Person *person5 = [[Person alloc] initWithName:@"John"];
    [self.people addObject:person5];
    Person *person6 = [[Person alloc] initWithName:@"Joe"];
    [self.people addObject:person6];
    
    NSLog(@"world: %@", self.people);
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
