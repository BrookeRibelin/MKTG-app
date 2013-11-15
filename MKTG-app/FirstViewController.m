//
//  FirstViewController.m
//  MKTG-app
//
//  Created by Brooke on 11/14/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    self.navigationItem.title=@"What's Missing?";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttontapped:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"What's Missing from MKTG app"];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"wantfanfics@gmail.com", nil];
        [mail setToRecipients:toRecipients];
        NSString *emailBody = @"I saw your app and thought...";
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
