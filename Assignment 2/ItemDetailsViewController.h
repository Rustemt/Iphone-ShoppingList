//
//  ItemDetailsViewController.h
//  Assignment 2
//
//  Created by Karim Ainine on 19/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingItem.h"

@interface ItemDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
	IBOutlet UITableView *tableview;
	IBOutlet UITableViewCell *nameCell;
	IBOutlet UITableViewCell *descriptionCell;
	IBOutlet UITableViewCell *amountCell;
}

- (id) initWithItem:(ShoppingItem *)item;

@end
