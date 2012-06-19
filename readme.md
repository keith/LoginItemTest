## What's this?

This is a demo application using SMLoginItemSetEnabled to enable your sandboxed applications to launch when the user logs in.

## Notes
This demo application and your application **will only work if they are deployed** preferably in the `/Applications/MyGreat.app` and **will not** work reliably from the Xcode debug folder.

## How to?

If you would like to build up this template application go for it. I would recommend you take some of the resources and implement them in your own project.

### Project settings

These are the settings of my project that worked perfectly with this implementation.

1. Create a new project with ARC enabled
2. Sandbox both your main application and helper application(if you haven't created a helper yet we will get to it shortly) I also enabled code signing
3. Since this was just a test application I had no entitlements enabled for either the main application or the helper
4. If you haven't already, create a helper app. Go to your project settings and click "Add Target" choose a Cocoa Application. Name it something such as MyAwesomeProjectHelper also with ARC enabled. (I left its "App Store Category" blank)
5. Now select the Target of your main application. Go to Build Phases -> Add Build Phase -> Add Copy Files.
6. Change the Destination to Wrapper. Make the Subpath `Contents/Library/LoginItems` leave Copy only when installing unchecked. Drag your helper application from Products on the left into the tableview.

### Main Application code setup

1. Import ServiceManagement.framework into your main application(not your helper) and include `#import <ServiceManagement/ServiceManagement.h>` in your .h file
2. Grab [StartAtLoginController](https://github.com/alexzielenski/StartAtLoginController) from Github. This is an easy to use class by [Alex Zielenski](https://twitter.com/#!/alexzielenski) to deal with the complications of adding, removing and querying login items. Import `StartAtLoginController.h` into your h file.
3. Create whatever interface you want to for controlling this setting. *If your application automatically enables this it will be denied from the Mac App Store(per guideline #2.26)*
4. Implement a method such as `- (IBAction)checkChanged:(id)sender` I made a simple checkbox tied to the StandardUserDefaults. (If you chose to do something else your implementation for this may vary.) I also bound the checkbox to `IBOutlet NSButton *loginCheck;` in order to determine it's state. This could also be done through `[[NSUserDefaults standardUserDefaults] boolForKey:YourKey]`
5. Implement code similar to this in your .m file.

		StartAtLoginController *loginController = [[StartAtLoginController alloc] init];
		[loginController setBundle:[NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/HelperApp.app"]]]; 
		// Change "HelperApp.app" to the name of your helper
		
		if ([loginCheck state]) {
        	if (![loginController startAtLogin]) {
            	[loginController setStartAtLogin: YES];
            }
    	} else {
        	if ([loginController startAtLogin]) {
            	[loginController setStartAtLogin:NO];
        	}
    	}
6. That's it. As you can see in this project there are some other methods you may want to use such as:

		if ([loginController startAtLogin]) {
			NSLog(@"Error");
		}
For checking after you enable or disable the setting to make sure it worked correctly. Or this:

		BOOL startsAtLogin = [loginController startAtLogin];
		if (startsAtLogin) {
			// Do stuff
		}
To do something if the login helper is enabled.

### Helper Application code setup

Make sure to test this code vigorously with your implementation.

1. Make your helper application a UIElement by navigating to HelperApp.plist located in the Supporting Files group by default. Add a line at the bottom with the Key `Application is agent (UIElement)` and `YES` as the Value *(this will suppress the application from flashing a dock icon each time the user enables launch at login) I also deleted everything except for the App Delegate in interface builder*
2. Erase the default method `- (void)applicationDidFinishLaunching:(NSNotification *)aNotification` and replace it with `- (void)applicationWillFinishLaunching:(NSNotification *)aNotification`
3. Within this method implement code similar to this.

		NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent] stringByDeletingLastPathComponent] stringByDeletingLastPathComponent] stringByDeletingLastPathComponent];
		// This string takes you from MyGreat.App/Contents/Library/LoginItems/MyHelper.app to MyGreat.App This is an obnoxious but dynamic way to do this since that specific Subpath is required
		NSString *binaryPath = [[NSBundle bundleWithPath:appPath] executablePath]; // This gets the binary executable within your main application
		[[NSWorkspace sharedWorkspace] launchApplication:binaryPath];
		[NSApp terminate:nil];
	This code finds your main application, determines it's binary executable(required to launch the application within the sandbox)	 opens your application, then quits
4. That's it.

### Deploy

The last thing you should do when deploying your application for yourself or to the Mac App store is remove your Helper app from the Archived items. Do this by navigating to the Target of your HelperApp -> Build Settings -> Skip Install and set Yes for Release. Apple provides more information [here](http://developer.apple.com/library/ios/#documentation/ToolsLanguages/Conceptual/Xcode4UserGuide/DistApps/DistApps.html).

### Other stuff
A special thanks to [Alex Zielenski](https://twitter.com/#!/alexzielenski) for [StartAtLoginController](https://github.com/alexzielenski/StartAtLoginController). Also [Delite Studio](http://www.delitestudio.com/2011/10/25/start-dockless-apps-at-login-with-app-sandbox-enabled/) for an article on the topic. Unfortunately it didn't include everything.