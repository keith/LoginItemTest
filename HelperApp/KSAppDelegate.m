//
//  KSAppDelegate.m
//  HelperApp
//
//  Created by Keith Smiley on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSAppDelegate.h"

@implementation KSAppDelegate

@synthesize window = _window;

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent] stringByDeletingLastPathComponent]  stringByDeletingLastPathComponent] stringByDeletingLastPathComponent];
//    NSString *alertString = [@"bundlepath %@", appPath];
    NSAlert *alert = [NSAlert alertWithMessageText:appPath defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"hi"];
    [alert runModal];
    // get to the waaay top. Goes through LoginItems, Library, Contents, Applications
    [[NSWorkspace sharedWorkspace] launchApplication:appPath];
    [NSApp terminate:nil];
}

//- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
//{
//    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath]
//                            stringByDeletingLastPathComponent]
//                           stringByDeletingLastPathComponent]
//                          stringByDeletingLastPathComponent]
//                         stringByDeletingLastPathComponent]; 
//    
//    [[NSWorkspace sharedWorkspace] launchApplication:appPath];
//    
//    [NSApp terminate:nil];
//}
//
////- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
////{
////    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent] stringByDeletingLastPathComponent]  stringByDeletingLastPathComponent] stringByDeletingLastPathComponent]; 
////    // get to the waaay top. Goes through LoginItems, Library, Contents, Applications
////    [[NSWorkspace sharedWorkspace] launchApplication:appPath];
////    [NSApp terminate:nil];
////}
//
////- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
////{
////    // Insert code here to initialize your application
////}

@end
