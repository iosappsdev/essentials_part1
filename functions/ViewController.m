//
//  ViewController.m
//  functions
//
//  Created by Ricardo Ruiz on 5/27/14.
//  Copyright (c) 2014 iOS Apps Development, All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize timerNumber;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Button Actions

- (IBAction)dialNumber:(id)sender {
    [self dialFunctionality];
}

- (IBAction)setBackground:(id)sender {
    
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.jpg"]];
}

- (IBAction)speech:(id)sender {
    AVSpeechSynthesizer *tom = [[AVSpeechSynthesizer alloc]init];
    
    NSString *description = @"For all the talk of global honor and prestige that the Olympics bring to a host city, talk largely promoted by the International Olympic Committee itself, the truth is that the Games tend to smother cities in debt and saddle them with venues they can't ever use again.";
    
    AVSpeechUtterance *sayWhat = [AVSpeechUtterance speechUtteranceWithString:description];
    
    [sayWhat setRate:0.2f];
    [sayWhat setVolume:0.8f];
    
    [tom speakUtterance:sayWhat];
}

- (IBAction)randomString:(id)sender {
    
    //NSLog(@"%@",[self genRandStringLength:25]);
    NSLog(@"%@",[self genRandString]);
}
- (IBAction)timer:(id)sender {
    [self fireTimer:[timerNumber.text intValue]];
}

#pragma mark - Basic Functionalities 

// Using UIApplication's 'openURL' method
// The 'openURL' method allows you to programmatically:
// - Call a phone number using a NSString
// - Send a sms/text message using a NSString
// - Open a webpage using Safari iOS app
// - Send a email using a 'mailto' link
//
- (void)dialFunctionality {
    // Dial Number
    UIApplication *dial = [UIApplication sharedApplication];
    // Open Webpage
    [dial openURL:[NSURL URLWithString:@"sms:555-555-5555"]];
    // Open a url in Safari
    // [dial openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    // Create a new email
    // [dial openURL:[NSURL URLWithString:@"mailto:admin@internet.com"]];
}



// Random String Generator 1
// Returns a random string using '25' characters.
//
// example:
// NSString *mystring = [self genRandString];
// NSLog(@"%@",[self genRandString]);
//
- (NSString *)genRandString {
    int len = 25;
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()?[]{}";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

// Generates alpha-numeric-random string
- (NSString *)genRandStringLength:(int)len {
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()?[]{}";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}

- (void)bannerView:(ADBannerView *)
banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

- (void)fireTimer:(int)timeAmount {
    //Timer is fired with selector(Method Call)
    mytimer = [NSTimer scheduledTimerWithTimeInterval:timeAmount target:self selector:@selector(mymessage) userInfo:nil repeats:NO];
}
-(void)mymessage {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Timer Demo" message:@"Your timer is done" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    
    [alert show];
    [mytimer invalidate];
}
@end
