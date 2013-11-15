//
//  DetailViewController.m
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView
{
    //update user interface for detail view

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //set label text
    
    self.detailLabel.text = self.detailLabelContents;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
