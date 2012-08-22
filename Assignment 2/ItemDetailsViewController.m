//
//  ItemDetailsViewController.m
//  Assignment 2
//
//  Created by Karim Ainine on 19/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()
@property (strong, nonatomic) ShoppingItem *item;
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

- (IBAction)stepperValueChanged:(id)sender {
	quantityLabel.text = [NSString stringWithFormat:@"%i", (int)quantityStepper.value];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	self.title = self.item.name;
	
	nameTextField.text = self.item.name;
	nameTextField.delegate = self;
	
	descriptionTextField.text = self.item.description;
	descriptionTextField.delegate = self;
	
	quantityStepper.maximumValue = 100;
	quantityStepper.minimumValue = 0;
	quantityStepper.stepValue = 1;
	quantityStepper.value = self.item.quantity;
	
	quantityLabel.text = [NSString stringWithFormat:@"%i", (int)quantityStepper.value];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) viewWillDisappear:(BOOL)animated{
	if(self.editDelegate && [self.editDelegate respondsToSelector:@selector(itemEdited::::)]){
		[self.editDelegate itemEdited:self.item: nameTextField.text: descriptionTextField.text:quantityStepper.value];
	}
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


#pragma mark - UITextFieldDelegate implementation
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

@end
