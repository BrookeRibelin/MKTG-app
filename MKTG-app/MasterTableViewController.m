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

@implementation MasterTableViewController{
    NSArray *name;
    NSArray *searchResults;
}

@synthesize detailViewController = _detailViewController;
@synthesize terms, idnum, name, link, definition, comment, application, searchResults, print, searchTextTarget, searchStringTarget, num;

- (void)viewDidLoad
{
    self.navigationItem.title=@"Definitions";
    [super viewDidLoad];
    
    //pulls in terms dictionary and sets arrays from dictionary
    
    NSString *termsFile = [[NSBundle mainBundle] pathForResource:@"theterms" ofType:@"plist"];
    terms = [[NSDictionary alloc] initWithContentsOfFile:termsFile];
    idnum = [terms objectForKey:@"Id"];
    name = [terms objectForKey:@"Name"];
    link = [terms objectForKey:@"Link"];
    definition = [terms objectForKey:@"Definition"];
    comment = [terms objectForKey:@"Comment"];
    application = [terms objectForKey:@"Application"];
}

#pragma mark make table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [name count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [name objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark segue from table cell to detail view

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"GoToDetails"]){
        //DetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *searched = [searchResults objectAtIndex:indexPath.row];
            
            for (int i = 0; i < 106; i++)
            {
                indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                NSString *n = [name objectAtIndex:indexPath.row];
                if (searched == n)
                {
                    num = i;
                }
            }
            
            indexPath = [NSIndexPath indexPathForRow:num inSection:0];
            NSString *n = [name objectAtIndex:indexPath.row];
            NSString *l = [link objectAtIndex:indexPath.row];
            NSString *d = [definition objectAtIndex:indexPath.row];
            NSString *c = [comment objectAtIndex:indexPath.row];
            NSString *a = [application objectAtIndex:indexPath.row];
            
            print = [NSString stringWithFormat:@"%@\n%@\n\nDefinition:\n%@\n\nComment:\n%@\n\nApplication:\n%@", n,l,d,c,a];
            
            [[segue destinationViewController] setDetailLabelContents:print];
        
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            NSString *n = [name objectAtIndex:indexPath.row];
            //TODO remove NSString link from table
            NSString *l = [link objectAtIndex:indexPath.row];
            NSString *d = [definition objectAtIndex:indexPath.row];
            NSString *c = [comment objectAtIndex:indexPath.row];
            NSString *a = [application objectAtIndex:indexPath.row];
            
            print = [NSString stringWithFormat:@"Definition:\n%@\n\nComment:\n%@\n\nApplication:\n%@", d,c,a];
            
            [[segue destinationViewController] setDetailLabelContents:print];
            [[segue destinationViewController] setDetailLabelTitle:n];
            [[segue destinationViewController] setDetailLabelTitleLink:l];
        }
    }
}

#pragma mark search

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    searchTextTarget = searchText;
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF CONTAINS[cd] %@", searchTextTarget];
    
    searchResults = [name filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    searchStringTarget = searchString;
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
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

@end
