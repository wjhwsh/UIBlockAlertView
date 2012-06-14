//
//  UDViewController.m
//  UIBlockAlertViewSample
//
//  Created by Wang, James on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UDViewController.h"
#import "UIBlockAlertView.h"
@interface UDViewController ()

@end

@implementation UDViewController
@synthesize clickedButtonLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setClickedButtonLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)AlertTestButtonClicked:(id)sender {
  
  UIBlockAlertView *alertView = [[UIBlockAlertView alloc] initWithTitle:@"UIBlockAlertView" message:@"Click a button please?" onButtonClick:^(NSInteger buttonIndex){
    NSString *buttonClicked = [NSString stringWithFormat:@"Button at index :%d was clicked.", buttonIndex];
    if (buttonIndex == 0) {
      buttonClicked = @"Cancel button was clicked";
    }
    self.clickedButtonLabel.text = buttonClicked;
  }cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button1", @"Button2", @"Button3", nil];
  
  [alertView show];
  [alertView release];
  
  
}
- (void)dealloc {
  [clickedButtonLabel release];
  [super dealloc];
}
@end
