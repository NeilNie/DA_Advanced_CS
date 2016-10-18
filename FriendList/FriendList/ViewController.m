//
//  ViewController.m
//  FriendList
//
//  Created by Yongyang Nie on 10/14/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - UITableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idTableCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.people nodeAt:(int)indexPath.row].object;
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
    
    [self.people addObject:string];
    [self.tableView reloadData];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    self.people = [[LinkedList alloc] init];
    [self.people addObject:@"Neil"];
    [self.people addObject:@"Joseph"];
    NSString *string = [self.people nodeAt:0].object;
    NSLog(@"%@", string);
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
    }else{
        PersonViewController *controller = [segue destinationViewController];
        //controller.
    }
}

@end
