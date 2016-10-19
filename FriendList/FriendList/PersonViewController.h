//
//  PersonViewController.h
//  FriendList
//
//  Created by Yongyang Nie on 10/18/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *nameTitle;
@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
