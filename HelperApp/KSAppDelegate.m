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
                         stringByDeletingLastPathComponent]; // Removes path down to /Applications/Great.app
    NSString *binaryPath = [[NSBundle bundleWithPath:appPath] executablePath]; // Uses string with bundle binary executable
    [[NSWorkspace sharedWorkspace] launchApplication:binaryPath]; // Launches binary
//        NSAlert *alert = [NSAlert alertWithMessageText:binaryPath defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"hi"];
//        [alert runModal]; // Use this NSAlert if your helper does not automatically your main application to see what path it's trying to open.
    [NSApp terminate:nil]; // Required to kill helper app
}

@end