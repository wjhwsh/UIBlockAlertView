//
//  UDViewController.h
//  UIBlockAlertViewSample
//
//  Created by Wang, James on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UDViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *clickedButtonLabel;
- (IBAction)AlertTestButtonClicked:(id)sender;

@end
