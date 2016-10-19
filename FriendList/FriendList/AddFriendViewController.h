//
//  AddFriendTableViewController.h
//  FriendList
//
//  Created by Yongyang Nie on 10/19/16.
//  Copyright © 2016 Yongyang Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkedList.h"
#import "Person.h"

@interface AddFriendViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) LinkedList *world;
@property (retain, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@protocol AddFriendViewControllerDelegate <NSObject>

- (void)addFriend:(Person *)person;

@end
