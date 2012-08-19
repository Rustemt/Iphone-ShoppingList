//
//  ShoppingList.m
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList

@synthesize list = _list;

-(NSMutableArray *)list{
	if(!_list){
		ShoppingItem *tiolet_paper = [[ShoppingItem alloc] initItem: @"Toilet Paper": @"In Rolls": 2];
		ShoppingItem *bananas = [[ShoppingItem alloc] initItem: @"Bananas": @"In Kilos": 3];
		_list = [[NSMutableArray	alloc] initWithObjects:tiolet_paper, bananas, nil];
	}
	return _list;
}

-(void) addItem:(ShoppingItem *)item{
	[self.list addObject:item];
}

-(void) deleteItem:(NSInteger)index{
	[self.list removeObjectAtIndex:index];
}

-(void) editItem:(NSInteger)index :(ShoppingItem *)item{
	ShoppingItem *origin = [self.list objectAtIndex:index];
	origin.name = item.name;
	origin.description = item.description;
	origin.quantity = item.quantity;
}

-(void) moveItem: (NSInteger) from: (NSInteger) to{
	NSString *item = [self.list objectAtIndex:from];
	[self.list removeObject:item];
	[self.list insertObject:item atIndex:to];
}

@end
