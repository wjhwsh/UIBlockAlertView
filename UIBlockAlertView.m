//
//  UIBlockAlertView.m
// 
//
//  Created by Wang, James on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIBlockAlertView.h"
@interface UIBlockAlertView()
@property (copy, nonatomic) void (^onButtonClick)(NSInteger);

@end

@implementation UIBlockAlertView
@synthesize onButtonClick = onButtonClick_;

- (id)initWithTitle:(NSString *)title message:(NSString *)message onButtonClick:(void (^)(NSInteger buttonIndex))onButtonClickBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
  
  self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
  if (self) {
    if ( nil != otherButtonTitles )
    {
      
      va_list args;
      va_start(args, otherButtonTitles);
      
      id arg;
      while ( nil != ( arg = va_arg( args, id ) ) )
      {
        if ( ![arg isKindOfClass: [NSString class] ] )
          return nil;
        
        [self addButtonWithTitle: (NSString*)arg ];
      }
    }
    self.onButtonClick = onButtonClickBlock;
  }
  return self;
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (self.onButtonClick) {
    self.onButtonClick(buttonIndex);
  }
}

- (void)dealloc {
  [onButtonClick_ release];
  [super dealloc];
}

@end
