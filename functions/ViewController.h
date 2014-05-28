//
//  ViewController.h
//  functions
//
//  Created by Ricardo Ruiz on 5/27/14.
//  Copyright (c) 2014 iOS Apps Development, All rights reserved.
//

#import <UIKit/UIKit.h>
// Still required for some frameworks.
#import <iAd/iAd.h> // iAd Framework
//
//
// AVFoundation is required to use 
@import AVFoundation;
//
// @import FrameworkName;
//
// Using '@import' save you the need to also import the project's
// Linked-Frameworks. You can use the '@import' for Apple frameworks
// ONLY.
//
// **This is a new feature and is still kind of buggy, as we saw with
// the line below '@import iAd;' when we complied we got a compiler
// error related to the iAd framework.
//
// @import iAd;

@interface ViewController : UIViewController<ADBannerViewDelegate> {
    NSTimer *mytimer;
}
- (IBAction)dialNumber:(id)sender;
- (IBAction)setBackground:(id)sender;
- (IBAction)speech:(id)sender;
- (IBAction)randomString:(id)sender;
- (IBAction)timer:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *timerNumber;

@end
