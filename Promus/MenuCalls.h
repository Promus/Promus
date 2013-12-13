//
//  MenuCalls.h
//  Promus
//
//  Copyright © 2013 by Johannes Frotscher (Date: 23 Mar 2013).
//

#import <Cocoa/Cocoa.h>
#import "PreferencesController.h"
#import "PromusMenu.h"


@interface MenuCalls : NSObject <NSApplicationDelegate>
{
    IBOutlet NSMenu *theMenu2;
    IBOutlet NSMenuItem *Item1;
    IBOutlet NSMenuItem *Item2;
    IBOutlet NSMenuItem *Item3;
    IBOutlet NSMenuItem *Item4;
    IBOutlet NSMenuItem *Item5;
    IBOutlet NSMenuItem *Item6;
    
    IBOutlet NSTableView *aTableView;
    IBOutlet NSWindow *aTableWindow;
}

-(IBAction) loadCompanyURL:(id)sender;
-(IBAction) loadMacUpdateURL:(id)sender;
-(IBAction) loadFeedbackURL:(id)sender;

-(void) populateTable:(NSTimer*)timer;

-(IBAction) fireUpActivityMonitor:(id)sender;
-(IBAction) closeATableWindow:(id)sender;

@property(assign) IBOutlet NSArrayController *myArrayController;

-(IBAction)copyToClipboardCPUUsage:(id)sender;
-(IBAction)copyToClipboardDateAndTime:(id)sender;
-(IBAction)copyToClipboardUptime:(id)sender;
-(IBAction)copyToClipboardIP:(id)sender;
-(IBAction)copyToClipboardTemps:(id)sender;
-(IBAction)copyToClipboardFreeSpace:(id)sender;
-(IBAction)copyToClipboardFreeRAM:(id)sender;

-(IBAction)controlTextDidEndEditing:(id)sender;

@property (assign) IBOutlet NSSearchField *mySearchField;

@property (nonatomic, retain) NSMutableArray *array4;

+ (id)sharedManager;

@end
