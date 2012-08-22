//
//  ShoppingList.h
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingItem.h"

@interface ShoppingList : NSObject

@property (nonatomic, strong) NSMutableArray *list;
-(void) editItem:(ShoppingItem *)item: (NSString *) name: (NSString *) description: (NSInteger) quantity;
-(void) addItem: (ShoppingItem *) item;
-(void) deleteItem: (NSInteger) index;
-(void) moveItem: (NSInteger) from: (NSInteger) to;
@end
