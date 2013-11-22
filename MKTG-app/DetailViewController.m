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

@synthesize textcontent;

- (void)configureView
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //TODO if the value for link is not empty
    //TODO set color for state equal to blue
    //TODO else set it to black
    //creates a title and makes the title into a link
    titleLinkButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLinkButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLinkButton.titleLabel.numberOfLines = 0;
	[titleLinkButton setTitle:self.detailLabelTitle forState:UIControlStateNormal];
    //sets label text to include definition
    self.detailLabel.editable = NO;
    self.detailLabel.text = self.detailLabelContents;
    
    textcontent = [NSString stringWithFormat:@"I found this awesome term through the PS Insights MKTG app \n\n%@: \n\n%@", self.detailLabelTitle, _detailLabelContents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openLinkInSafari:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.detailLabelTitleLink]];
}

#pragma mark uitextview no editing

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}

#pragma mark social


- (IBAction)social:(id)sender {
    UIActionSheet *share = [[UIActionSheet alloc] initWithTitle:@"Share this term!" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Tweet it!", @"Facebook it!", nil];
    
    [share showInView:[self.view window]];
    
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Each button title we gave to our action sheet is given a tag starting with 0.
    if (buttonIndex == 0) {
        
        //Check Twitter accessibility and at least one account is setup.
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            
            SLComposeViewController *tweetSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            //This is setting the initial text for our share card.
            //TODO edit text to contain better message
            //[tweetSheet setInitialText:@"veasoftware.com made it easy to intergate Twitter with iOS 6! :D "];
            [tweetSheet setInitialText:textcontent];

            
            //Brings up the little share card with the test we have pre defind.
            [self presentViewController:tweetSheet animated:YES completion:nil];
            
        } else {
            //This alreat tells the user that they can't use built in socal interegration and why they can't.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't send a tweet right now, make sure you have at least one Twitter account setup and your device is using iOS6." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
            [alertView show];
        }
        
    }else if (buttonIndex == 1) {
        
        //Check Facebook accessibility and at least one account is setup.
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            SLComposeViewController *facebookSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            //This is setting the initial text for our share card.

            //TODO set text to contain better message
            //[facebookSheet setInitialText:@"veasoftware.com made it easy to integrate Facebook with iOS 6! :D "];
            [facebookSheet setInitialText:textcontent];

            
            //Brings up the little share card with the test we have pre defind.
            [self presentViewController:facebookSheet animated:YES completion:nil];
            
        } else {
            //This alreat tells the user that they can't use built in socal interegration and why they can't.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't post a Facebook post right now, make sure you have at least one Facebook account setup and your device is using iOS6." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
    }
}

#pragma mark email

- (IBAction)email:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"The MKTG app is awesome!"];
        NSArray *toRecipients = [NSArray arrayWithObjects: nil];
        [mail setToRecipients:toRecipients];
        NSString *emailBody = [NSString stringWithFormat:@"%@", textcontent];
        [mail setMessageBody:emailBody isHTML:NO];
        mail.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:mail animated:YES completion:nil];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, we had a few issues" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Saved");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Sent");
            break;
            
        default:
            NSLog(@"default");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
