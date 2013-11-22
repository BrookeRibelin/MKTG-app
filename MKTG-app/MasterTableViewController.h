//
//  MasterTableViewController.h
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSDictionary *terms;
@property (nonatomic, strong) NSArray *idnum;
@property (nonatomic, strong) NSArray *name;
@property (nonatomic, strong) NSArray *link;
@property (nonatomic, strong) NSArray *definition;
@property (nonatomic, strong) NSArray *comment;
@property (nonatomic, strong) NSArray *application;
@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, strong) NSString *print;
@property (nonatomic, strong) NSString *searchTextTarget;
@property (nonatomic, strong) NSString *searchStringTarget;
@property int num;
    
@property (strong, nonatomic) DetailViewController *detailViewController;

@end
