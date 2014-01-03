//
//  MenuCalls.h
//  Promus
//
//  Copyright © 2014 by Johannes Frotscher (Date: 23 Mar 2013).
//

#import <Cocoa/Cocoa.h>
#import "Preferences.h"
#import "Menulet.h"


@interface MenuItems : NSObject <NSApplicationDelegate>

-(IBAction) loadCompanyURL:(id)sender;
-(IBAction) loadMacUpdateURL:(id)sender;
-(IBAction) loadFeedbackURL:(id)sender;

-(IBAction)copyToClipboardCPUUsage:(id)sender;
-(IBAction)copyToClipboardDateAndTime:(id)sender;
-(IBAction)copyToClipboardUptime:(id)sender;
-(IBAction)copyToClipboardIP:(id)sender;
-(IBAction)copyToClipboardTemps:(id)sender;
-(IBAction)copyToClipboardFreeSpace:(id)sender;
-(IBAction)copyToClipboardFreeRAM:(id)sender;

@end
