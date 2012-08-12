//
//  ShoppingItem.m
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import "ShoppingItem.h"

@implementation ShoppingItem

@synthesize name = _name;
@synthesize description = _description;
@synthesize quantity = _quantity;

-(ShoppingItem *) initItem: (NSString *) name: (NSString *) description: (NSNumber *) quantity{
	ShoppingItem *item = [[ShoppingItem alloc] init];
	item.name = name;
	item.description = description;
	item.quantity = quantity;
	return item;
}
@end