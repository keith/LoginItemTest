//
//  KSAppDelegate.m
//  LoginItemTest
//
//  Created by Keith Smiley on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSAppDelegate.h"

@implementation KSAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Do stuff
}

- (IBAction)checkChanged:(id)sender {
    StartAtLoginController *loginController = [[StartAtLoginController alloc] init];
    [loginController setBundle:[NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/HelperApp.app"]]]; // Path to helper app within main bundle. THIS PATH IS REQUIRED!
    if ([loginCheck state]) {
        if (![loginController startAtLogin]) {
            [loginController setStartAtLogin: YES];
            
//            if (![loginController startAtLogin]) { // Error checking if you want
//                NSLog(@"Register error");
//            }
        }
    } else {
        if ([loginController startAtLogin]) {
            [loginController setStartAtLogin:NO];
            
//            if ([loginController startAtLogin]) { // Error checking if you want
//                NSLog(@"Error");
//            }
        }
    }
    
//    BOOL startsAtLogin = [loginController startAtLogin]; // Use to check if it is set or not set.
//    if (startsAtLogin) {
//        NSAlert *alert = [NSAlert alertWithMessageText:@"Item registered" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"Score!"];
//        [alert runModal];
//    }
}

@end