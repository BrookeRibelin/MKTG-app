//
//  DetailViewController.h
//  MKTG-app
//
//  Created by Brooke on 11/15/13.
//  Copyright (c) 2013 PS Insights. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *detailLabelContents;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
