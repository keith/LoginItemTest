//
//  KSAppDelegate.m
//  LoginItemTest
//
//  Created by Keith Smiley on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSAppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation KSAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    StartAtLoginController *loginController = [[StartAtLoginController alloc] init];
	[loginController setBundle:[NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/HelperApp.app"]]];
    [loginController setStartAtLogin: YES]; 
    
    BOOL startsAtLogin = [loginController startAtLogin];
    if (startsAtLogin) {
        NSAlert *alert = [NSAlert alertWithMessageText:@"Item registered" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"hi"];
        [alert runModal];
    }
    
//    Second function to check if login item is registered
//    if ([self appIsPresentInLoginItems]) {
//        NSAlert *alert = [NSAlert alertWithMessageText:@"Working!" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"hi"];
//        [alert runModal];
//    }
}

//-(BOOL)appIsPresentInLoginItems
//{
//    NSString *bundleID = @"com.ks.HelperApp";
//    NSArray * jobDicts = nil;
//    jobDicts = (__bridge NSArray *)SMCopyAllJobDictionaries( kSMDomainUserLaunchd );
//    // Note: Sandbox issue when using SMJobCopyDictionary()
//    
//    if ( (jobDicts != nil) && [jobDicts count] > 0 ) {
//        
//        BOOL bOnDemand = NO;
//        
//        for ( NSDictionary * job in jobDicts ) {
//            
//            if ( [bundleID isEqualToString:[job objectForKey:@"Label"]] ) {
//                bOnDemand = [[job objectForKey:@"OnDemand"] boolValue];
//                break;
//            }
//        }
//        
//        CFRelease((__bridge CFDictionaryRef)jobDicts); jobDicts = nil;
//        return bOnDemand;
//        
//    }
//    return NO;
//}

@end