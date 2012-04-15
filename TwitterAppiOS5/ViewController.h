//
//  ViewController.h
//  TwitterAppiOS5
//
//  Created by Deepak Keswani on 15/04/12.
//  Copyright (c) 2012 D-Kay Consultancy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>


@interface ViewController : UIViewController {
    IBOutlet UITextField *message;
    IBOutlet UITextField *website;
}

- (IBAction) tweetMessage;
- (IBAction) closeKeyboard;

@end
