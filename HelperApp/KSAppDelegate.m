//
//  KSAppDelegate.m
//  HelperApp
//
//  Created by Keith Smiley on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSAppDelegate.h"

@implementation KSAppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath]
                           stringByDeletingLastPathComponent]
                           stringByDeletingLastPathComponent]
                         stringByDeletingLastPathComponent]
                         stringByDeletingLastPathComponent]; 
    NSString *binaryPath = [[NSBundle bundleWithPath:appPath] executablePath];
    [[NSWorkspace sharedWorkspace] launchApplication:binaryPath];
//        NSAlert *alert = [NSAlert alertWithMessageText:binaryPath defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"hi"];
//        [alert runModal];
    [NSApp terminate:nil];
}

@end