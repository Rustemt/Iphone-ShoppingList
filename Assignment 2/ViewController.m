//
//  ViewController.m
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingItem.h"
#import "ShoppingList.h"

@interface ViewController ()
@property (nonatomic, strong) ShoppingList *list;
@end

@implementation ViewController

@synthesize tableView = _tableView;
@synthesize list = _list;

-(ShoppingList *)list{
	if(!_list) _list = [[ShoppingList alloc] init];
	return _list;
}

-(IBAction) addItem:(id)sender{
	ShoppingItem *item = [[ShoppingItem alloc] initItem:@"New Item" :@"" :0];
	[self.list addItem:item];
	[self.tableView reloadData];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.title = @"Shopping List";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector (addItem:)];
	self.navigationItem.rightBarButtonItem = addButton;
	
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
	if(editing != self.editing){
		if(editing){
			self.navigationItem.rightBarButtonItem = nil;
		}else{
			UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector (addItem:)];
			self.navigationItem.rightBarButtonItem = addButton;
		}
		
		[super setEditing:editing animated:animated];
		[self.tableView setEditing:editing animated:animated];
	}
}

-(void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	if(editingStyle == UITableViewCellEditingStyleDelete){
		[self.list deleteItem:indexPath.row];
		[tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
	}
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section{
	return self.list.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
	if(nil == cell){
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
	
	ShoppingItem *item = [self.list.list objectAtIndex:indexPath.row];
	cell.textLabel.text = item.name;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	return cell;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
   return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[self.list moveItem:fromIndexPath.row :toIndexPath.row];
	[self.tableView reloadData];
}

#pragma mark - UITableViewDelegate implementation

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	ShoppingItem *item = [self.list.list objectAtIndex:indexPath.row];
	
	/* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:city.name message:city.description delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
	 [alert show];*/
	
	ItemDetailsViewController *detailsController = [[ItemDetailsViewController alloc] initWithItem:item];
	detailsController.editDelegate = self;
	[self.navigationController pushViewController:detailsController animated:YES];
	[tv deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -  EditItemDelegate implemenation
-(void) itemEdited:(ShoppingItem *)item: (NSString *) name: (NSString *) description: (NSInteger) quantity{
	[self.list editItem:item :name :description :quantity];
	[self.tableView reloadData];
}

@end
