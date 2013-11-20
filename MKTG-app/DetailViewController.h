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
{
    IBOutlet UIButton *titleLinkButton;
    
}
@property (strong, nonatomic) NSString *detailLabelContents;
@property (strong, nonatomic) NSString *detailLabelTitle;
@property (strong, nonatomic) NSString *detailLabelTitleLink;
@property (strong, nonatomic) NSString *textcontent;
@property (weak, nonatomic) IBOutlet UITextView *detailLabel;

- (IBAction)social:(id)sender;
- (IBAction)openLinkInSafari:(id)sender;


- (IBAction)email:(id)sender;

@end
