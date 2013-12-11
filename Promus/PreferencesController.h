//  PreferencesController.h
//  Promus
//  Copyright © 2013 by Johannes Frotscher (Date: 23 Mar 2013).

#import <Cocoa/Cocoa.h>
#import "PromusMenu.h"
#import "MenuCalls.h"

extern NSString* GeneralToolbarItemIdentifier;
extern NSString* CleanToolbarItemIdentifier;
extern NSString* BatchToolbarItemIdentifier;
extern NSString* TimerItemIdentifier;
extern NSString* SecurityToolbarItemIdentifier;
extern NSString* ReportsToolbarItemIdentifier;
extern NSString* ConsoleToolbarItemIdentifier;
extern NSString* SoftwareUpdatesToolbarItemIdentifier;

@interface PreferencesController : NSWindowController
{
  IBOutlet NSView* generalView;
  IBOutlet NSView* cleanView;
  IBOutlet NSView* batchView;
  IBOutlet NSView* timerView;
  IBOutlet NSView* securityView;
  IBOutlet NSView* reportsView;
  IBOutlet NSView* consoleView;
  IBOutlet NSView* softwareupdatesView;
  IBOutlet NSView* emptyView;
  NSMutableDictionary* toolbarItems;
}

-(IBAction) toolbarHit:(id)sender;

-(IBAction) gotoPreferencePane:(id)sender;

-(void) selectPreferencesPaneWithItemIdentifier:(NSString*)itemIdentifier;

@end