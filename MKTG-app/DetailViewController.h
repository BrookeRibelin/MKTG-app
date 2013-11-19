//
//  DetailViewController.h
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIActionSheetDelegate>
{
    IBOutlet UIButton *titleLinkButton;
    
}
@property (strong, nonatomic) NSString *detailLabelContents;
@property (strong, nonatomic) NSString *detailLabelTitle;
@property (strong, nonatomic) NSString *detailLabelTitleLink;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
- (IBAction)social:(id)sender;
- (IBAction)openLinkInSafari:(id)sender;


@end
