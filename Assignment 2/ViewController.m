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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.title = @"Shopping List";
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

#pragma mark - UITableViewDelegate implementation

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}
@end
