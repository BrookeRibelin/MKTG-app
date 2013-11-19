//
//  MasterTableViewController.m
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import "MasterTableViewController.h"

#import "DetailViewController.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

@synthesize detailViewController = _detailViewController;
@synthesize terms, name, link, definition, comment, application;

- (void)viewDidLoad
{
    self.navigationItem.title=@"Definitions";
    NSString *termsFile = [[NSBundle mainBundle] pathForResource:@"theterms" ofType:@"plist"];
    terms = [[NSDictionary alloc] initWithContentsOfFile:termsFile];
    name = [terms objectForKey:@"Name"];
    link = [terms objectForKey:@"Link"];
    definition = [terms objectForKey:@"Definition"];
    comment = [terms objectForKey:@"Comment"];
    application = [terms objectForKey:@"Application"];

    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *nameOfTerm = [name objectAtIndex:indexPath.row];
    cell.textLabel.text = nameOfTerm;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if ([[segue identifier] isEqualToString:@"GoToDetails"]){
            NSIndexPath *indexPath = nil;
            
            indexPath = [self.tableView indexPathForSelectedRow];
            NSString *n = [name objectAtIndex:indexPath.row];
            //TODO remove NSString link from table
            NSString *l = [link objectAtIndex:indexPath.row];
            NSString *d = [definition objectAtIndex:indexPath.row];
            NSString *c = [comment objectAtIndex:indexPath.row];
            NSString *a = [application objectAtIndex:indexPath.row];
            
            NSString *print = [NSString stringWithFormat:@"%@\r%@\r%@\r%@\r%@", n,l,d,c,a];
            
            [[segue destinationViewController] setDetailLabelContents:print];
            [[segue destinationViewController] setDetailLabelTitle:n];
            [[segue destinationViewController] setDetailLabelTitleLink:l];
        }
}
    
@end
