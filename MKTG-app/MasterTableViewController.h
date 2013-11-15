//
//  MasterTableViewController.h
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterTableViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *terms;
@property (nonatomic, strong) NSArray *name;
@property (nonatomic, strong) NSArray *definition;

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
