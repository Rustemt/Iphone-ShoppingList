//
//  ViewController.h
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailsViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EditItemDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
