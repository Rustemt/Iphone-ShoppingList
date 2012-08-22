//
//  ItemDetailsViewController.h
//  Assignment 2
//
//  Created by Karim Ainine on 19/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingItem.h"

@protocol EditItemDelegate <NSObject>
-(void) itemEdited:(ShoppingItem *)item: (NSString *) name: (NSString *) description: (NSInteger) quantity;
@end

@interface ItemDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
	IBOutlet UITableView *tableview;
	
	IBOutlet UITableViewCell *nameCell;
	IBOutlet UITableViewCell *descriptionCell;
	IBOutlet UITableViewCell *amountCell;
	
	IBOutlet UITextField *descriptionTextField;
	IBOutlet UITextField *nameTextField;
	IBOutlet UILabel *quantityLabel;
	IBOutlet UIStepper *quantityStepper;
}

- (id) initWithItem:(ShoppingItem *)item;
@property (weak, nonatomic) id<EditItemDelegate> editDelegate;

@end
