//
//  ViewController.h
//  FriendList
//
//  Created by Yongyang Nie on 10/14/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "PersonViewController.h"
#import "AddPersonViewController.h"
#import "Person.h"

@interface MasterViewController : UIViewController <AddPersonViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) LinkedList *people;

@end

