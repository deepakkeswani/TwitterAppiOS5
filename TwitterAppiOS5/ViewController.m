//
//  ViewController.m
//  TwitterAppiOS5
//
//  Created by Deepak Keswani on 15/04/12.
//  Copyright (c) 2012 D-Kay Consultancy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)tweetMessage {
    
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc]init];
    [twitter setInitialText:message.text];
    [twitter addURL:[NSURL URLWithString:website.text]];
    if ([TWTweetComposeViewController canSendTweet] ) {
        [self presentViewController:twitter animated:YES completion:nil ];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Unable to tweet" message:@"This only works with Twitter configured iOS 5" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alertView show];
        return;
    }
    twitter.completionHandler = ^(TWTweetComposeViewControllerResult res) {
        if(res == TWTweetComposeViewControllerResultDone) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Tweeet Succeeded" message:@"Message Sent Successfully" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alertView show];
        }else {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Tweet Failed" message:@"Message sending Failed, Try again Later..." delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alertView show];
        }
    };
}

- (IBAction) closeKeyboard {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
