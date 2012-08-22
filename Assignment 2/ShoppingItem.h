//
//  ShoppingItem.h
//  Assignment 2
//
//  Created by Karim Ainine on 12/08/12.
//  Copyright (c) 2012 Karim Ainine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property NSInteger quantity;

-(ShoppingItem *) initItem: (NSString *) name: (NSString *) description: (NSInteger) quantity;
@end
