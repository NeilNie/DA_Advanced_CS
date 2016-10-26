//
//  PersonViewController.h
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "AddFriendViewController.h"

@interface PersonViewController : UIViewController <AddFriendViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UINavigationItem *nameTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSUInteger personIndex;
@property (weak, nonatomic) LinkedList *theWorld;
@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
