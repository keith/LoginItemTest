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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    StartAtLoginController *loginController = [[StartAtLoginController alloc] init];
	[loginController setBundle:[NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/HelperApp.app"]]]; // Path to helper app within main bundle. THIS PATH IS REQUIRED!
    [loginController setStartAtLogin: YES]; 
    
    BOOL startsAtLogin = [loginController startAtLogin];
    if (startsAtLogin) {
        NSAlert *alert = [NSAlert alertWithMessageText:@"Item registered" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"Score!"];
        [alert runModal];
    }
}

@end