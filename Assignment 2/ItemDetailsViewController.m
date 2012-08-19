//
//  ItemDetailsViewController.m
//  Assignment 2
//
//  Created by Karim Ainine on 19/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()
@property (weak, nonatomic) ShoppingItem *item;
@end

@implementation ItemDetailsViewController

@synthesize item = _item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (id) initWithItem:(ShoppingItem *)item{
	if(self = [super init]){
		_item = item;
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	self.title = self.item.name;
	nameCell.detailTextLabel.text = self.item.name;
	descriptionCell.detailTextLabel.text = self.item.description;
	amountCell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.item.quantity];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if(section == 0){
		return 2;
	}else{
		return 1;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = nil;
	if(indexPath.section == 0){
		if( indexPath.row == 0 ) {
			cell = nameCell;
		} else {
			cell = descriptionCell;
		}
	}else{
		if(indexPath.row == 0){
			cell = amountCell;
		}
	}
	return cell;
}
#pragma mark - UITableViewDelegate implementation

@end
