//  PreferencesController.m
//  Promus
//  Copyright © 2013 by Johannes Frotscher (Date: 23 Mar 2013).

#import "PreferencesController.h"
#import "PromusMenu.h"
#import "MenuCalls.h"

NSString* GeneralToolbarItemIdentifier = @"GeneralToolbarItem";
NSString* CleanToolbarItemIdentifier = @"CleanToolbarItem";
NSString* BatchToolbarItemIdentifier = @"BatchToolbarItem";
NSString* TimerToolbarItemIdentifier = @"TimerToolbarItem";
NSString* SecurityToolbarItemIdentifier = @"SecurityToolbarItem";
NSString* ReportsToolbarItemIdentifier = @"ReportsToolbarItem";
NSString* ConsoleToolbarItemIdentifier = @"ConsoleToolbarItem";
NSString* SoftwareUpdatesToolbarItemIdentifier = @"SoftwareUpdatesToolbarItem";


@implementation PreferencesController

-(id) init
{
  if (![super initWithWindowNibName:@"Preferences"])
    return nil;
  toolbarItems = [[NSMutableDictionary alloc] init];
  return self;
}

-(void) dealloc
{
}

-(NSArray*) toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar
{
  return [NSArray arrayWithObjects:GeneralToolbarItemIdentifier, CleanToolbarItemIdentifier, BatchToolbarItemIdentifier, TimerToolbarItemIdentifier, SecurityToolbarItemIdentifier, ReportsToolbarItemIdentifier, ConsoleToolbarItemIdentifier, SoftwareUpdatesToolbarItemIdentifier, nil];
}

-(NSArray*) toolbarAllowedItemIdentifiers:(NSToolbar*)toolbar
{
  return [NSArray arrayWithObjects:GeneralToolbarItemIdentifier, CleanToolbarItemIdentifier, BatchToolbarItemIdentifier, TimerToolbarItemIdentifier, SecurityToolbarItemIdentifier, ReportsToolbarItemIdentifier, ConsoleToolbarItemIdentifier, SoftwareUpdatesToolbarItemIdentifier, NSToolbarCustomizeToolbarItemIdentifier, NSToolbarFlexibleSpaceItemIdentifier, NSToolbarSpaceItemIdentifier, NSToolbarSeparatorItemIdentifier, nil];
}

-(NSArray*) toolbarSelectableItemIdentifiers:(NSToolbar*)toolbar
{
  return [self toolbarDefaultItemIdentifiers:toolbar];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
  NSToolbarItem* item = [toolbarItems objectForKey:itemIdentifier];
  if (!item)
  {
    item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    
    NSString* label = nil;
    NSString* imagePath = nil;
    if ([itemIdentifier isEqualToString:GeneralToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"General" ofType:@"tiff"];
      label = NSLocalizedString(@"General", @"General");
    }
    else if ([itemIdentifier isEqualToString:CleanToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Clean" ofType:@"tiff"];
      label = NSLocalizedString(@"Clean", @"Clean");
    }
    else if ([itemIdentifier isEqualToString:BatchToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Batch" ofType:@"tiff"];
      label = NSLocalizedString(@"Batch", @"Batch");
    }
    else if ([itemIdentifier isEqualToString:TimerToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Timer" ofType:@"tiff"];
      label = NSLocalizedString(@"Timer", @"Timer");
    }
    else if ([itemIdentifier isEqualToString:SecurityToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Security" ofType:@"tiff"];
      label = NSLocalizedString(@"Security", @"Security");
    }
    else if ([itemIdentifier isEqualToString:ReportsToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Reports" ofType:@"tiff"];
      label = NSLocalizedString(@"Reports", @"Reports");
    }
    else if ([itemIdentifier isEqualToString:ConsoleToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"Console" ofType:@"tiff"];
      label = NSLocalizedString(@"Console", @"Console");
    }
    else if ([itemIdentifier isEqualToString:SoftwareUpdatesToolbarItemIdentifier])
    {
      imagePath = [[NSBundle mainBundle] pathForResource:@"SoftwareUpdates" ofType:@"tiff"];
      label = NSLocalizedString(@"SoftwareUpdates", @"SoftwareUpdates");
    }
    [item setLabel:label];
    [item setImage:[[NSImage alloc] initWithContentsOfFile:imagePath] ];

    [item setTarget:self];
    [item setAction:@selector(toolbarHit:)];
    [toolbarItems setObject:item forKey:itemIdentifier];
  }
  return item;
}



-(IBAction) toolbarHit:(id)sender
{
    
    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.plist" stringByExpandingTildeInPath];

    BOOL PrefsExist=[[NSFileManager defaultManager] fileExistsAtPath:path];
    
    NSLog(@"PrefsExist is: %d", PrefsExist);
    
    NSMutableDictionary *dictionaryPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    id Batch = [dictionaryPlist valueForKey:@"Batch"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;

    
//    BOOL *MyBool = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchClear"];
    
  NSView* view = nil;
  NSString* itemIdentifier = [sender itemIdentifier];
    if ([itemIdentifier isEqualToString:GeneralToolbarItemIdentifier])
    {
        view = generalView;
        NSLog(@"general view");
        
        if (PrefsExist == 0)
        {
            NSString *tessdataPath = [[NSBundle mainBundle] pathForResource:@"com.USE-Software.Promus" ofType:@"plist"];
            [fileManager copyItemAtPath:tessdataPath toPath:path error:&error];
        } else
        {
            
            //  NSString *path = [[NSBundle mainBundle] pathForResource:
            //                      @"com.USE-Software.Promus" ofType:@"plist"];
            
//            NSLog(@"Batch is: %@", Batch);
            
            BOOL BAll = [[Batch valueForKey:@"B All"] boolValue];
            // # to be used again!!:
//            BOOL BClean = [[Batch valueForKey:@"B Clean"] boolValue];
//            BOOL BExtraTasks = [[Batch valueForKey:@"B Extra Tasks"] boolValue];
//            BOOL BPerformPerdiodicTasks = [[Batch valueForKey:@"B Perform preiodic tasks"] boolValue];
//            BOOL BRepairPermissions = [[Batch valueForKey:@"B Repair permissions"] boolValue];
//            BOOL BSendReport = [[Batch valueForKey:@"B Send Report"] boolValue];
//            BOOL BUpdatePrebindings = [[Batch valueForKey:@"B Update prebindings"] boolValue];
//            BOOL BVerifyPreferences = [[Batch valueForKey:@"B Verify preferences"] boolValue];
            
            
            NSLog(@"BAll is: %d", BAll);
        }

        
        NSString *BatchAll = [dictionaryPlist valueForKey:@"B All"];
        NSLog(@"Batch All is: %@", BatchAll);
    }
    
    
  else if ([itemIdentifier isEqualToString:CleanToolbarItemIdentifier])
    view = cleanView;
  else if ([itemIdentifier isEqualToString:BatchToolbarItemIdentifier])
    view = batchView;
  else if ([itemIdentifier isEqualToString:TimerToolbarItemIdentifier])
    view = timerView;
  else if ([itemIdentifier isEqualToString:SecurityToolbarItemIdentifier])
    view = securityView;
  else if ([itemIdentifier isEqualToString:ReportsToolbarItemIdentifier])
    view = reportsView;
  else if ([itemIdentifier isEqualToString:ConsoleToolbarItemIdentifier])
    view = consoleView;
  else if ([itemIdentifier isEqualToString:SoftwareUpdatesToolbarItemIdentifier])
    view = softwareupdatesView;
	
  NSWindow* window = [self window];
  NSView* contentView = [window contentView];
  if (view != contentView)
  {
    NSRect oldContentFrame = contentView ? [contentView frame] : NSMakeRect(0, 0, 0, 0);
    NSRect newContentFrame = [view frame];
    NSRect newFrame = [window frame];
    newFrame.size.width  += (newContentFrame.size.width  - oldContentFrame.size.width);
    newFrame.size.height += (newContentFrame.size.height - oldContentFrame.size.height);
    newFrame.origin.y    -= (newContentFrame.size.height - oldContentFrame.size.height);
    [window contentView];
    [emptyView setFrame:newContentFrame];
    [window setContentView:emptyView];
    [window setFrame:newFrame display:YES animate:YES];
    [window contentView];
    [window setContentView:view];
  }
}

-(void) awakeFromNib
{
  NSToolbar* toolbar = [[NSToolbar alloc] initWithIdentifier:@"preferencesToolbar"];
    // # (id<NSToolbarDelegate>)self instead of just self, solved warning
  [toolbar setDelegate:(id<NSToolbarDelegate>)self];
  NSWindow* window = [self window];
  [window setToolbar:toolbar];
  [toolbar setAllowsUserCustomization:YES];
  [toolbar setAutosavesConfiguration:YES];
  [toolbar setDisplayMode: NSToolbarDisplayModeIconAndLabel];
  [toolbar setSizeMode: NSToolbarSizeModeSmall];
  [toolbar setSelectedItemIdentifier:GeneralToolbarItemIdentifier];
  [self toolbarHit:[toolbarItems objectForKey:[toolbar selectedItemIdentifier]]];
}

-(void) windowDidLoad
{
  NSPoint topLeftPoint   = [[self window] frame].origin;
  topLeftPoint.y += [[self window] frame].size.height;
  [[self window] setFrameAutosaveName:@"preferences"];
  [[self window] setFrameTopLeftPoint:topLeftPoint];  
}

-(IBAction) gotoPreferencePane:(id)sender
{
  NSUInteger tag = sender ? [sender tag] : -1;
  if (tag == 0)
  {
    [self selectPreferencesPaneWithItemIdentifier:GeneralToolbarItemIdentifier];
  }
  else if (tag == 1)
  {
    [self selectPreferencesPaneWithItemIdentifier:GeneralToolbarItemIdentifier];
  }
}

-(void) selectPreferencesPaneWithItemIdentifier:(NSString*)selectedItemIdentifier
{
  [[[self window] toolbar] setSelectedItemIdentifier:selectedItemIdentifier];
  [self toolbarHit:[toolbarItems objectForKey:selectedItemIdentifier]];
}
@end
