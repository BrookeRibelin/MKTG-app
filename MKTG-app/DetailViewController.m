//
//  DetailViewController.m
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import "DetailViewController.h"
#import <Social/Social.h>

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


- (IBAction)social:(id)sender {
    UIActionSheet *share = [[UIActionSheet alloc] initWithTitle:@"Sharing Goodness" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:@"Tweet it!", @"Facebook it!", nil];
    
    [share showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Each button title we gave to our action sheet is given a tag starting with 0.
    if (buttonIndex == 0) {
        
        //Check Twitter accessibility and at least one account is setup.
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            
            SLComposeViewController *tweetSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            //This is setting the initial text for our share card.
            [tweetSheet setInitialText:@"veasoftware.com made it easy to intergate Twitter with iOS 6! :D "];
            
            //Brings up the little share card with the test we have pre defind.
            [self presentViewController:tweetSheet animated:YES completion:nil];
            
        } else {
            //This alreat tells the user that they can't use built in socal interegration and why they can't.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't send a tweet right now, make sure you have at least one Twitter account setup and your device is using iOS6." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
    }else if (buttonIndex == 1) {
        
        //Check Facebook accessibility and at least one account is setup.
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            SLComposeViewController *facebookSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            //This is setting the initial text for our share card.
            [facebookSheet setInitialText:@"veasoftware.com made it easy to integrate Facebook with iOS 6! :D "];
            
            //Brings up the little share card with the test we have pre defind.
            [self presentViewController:facebookSheet animated:YES completion:nil];
            
        } else {
            //This alreat tells the user that they can't use built in socal interegration and why they can't.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't post a Facebook post right now, make sure you have at least one Facebook account setup and your device is using iOS6." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
    }
}
@end
