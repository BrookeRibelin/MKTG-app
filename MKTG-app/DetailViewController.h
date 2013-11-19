//
//  DetailViewController.h
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DetailViewController : UIViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSString *detailLabelContents;
@property (weak, nonatomic) IBOutlet UITextView *detailLabel;
@property (strong, nonatomic) NSString *textcontent;

- (IBAction)social:(id)sender;

- (IBAction)email:(id)sender;

@end
