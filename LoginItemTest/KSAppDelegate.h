//
//  KSAppDelegate.h
//  LoginItemTest
//
//  Created by Keith Smiley on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ServiceManagement/ServiceManagement.h>
#import "StartAtLoginController.h"

@interface KSAppDelegate : NSObject {
    IBOutlet NSButton *loginCheck;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)checkChanged:(id)sender;

@end