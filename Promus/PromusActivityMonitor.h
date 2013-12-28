//
//  PromusActivityMonitor.h
//  PromusActivityMonitor
//
//  Copyright © 2013 by USE-Software (Date: 23 Mar 2013).
//

#import <Cocoa/Cocoa.h>
#import "Snapshots.h"

@interface PromusActivityMonitor : NSObject
{
    IBOutlet NSTableView *aTableView;
    IBOutlet NSTableView *bTableView;
    IBOutlet NSWindow *aTableWindow;
}

@property (assign) IBOutlet NSButton *PromusActivityMonitorPause;
@property (assign) NSButton *closeButton;

@property (nonatomic, retain) NSTimer *timer;

@property (assign) IBOutlet NSArrayController *myArrayController;
@property (assign) IBOutlet NSArrayController *myArrayController2;

@property (assign) IBOutlet NSSearchField *mySearchField;

@property (retain) NSMutableArray *array1;
@property (retain) NSMutableArray *array2;
@property (retain) NSMutableArray *array3;
@property (retain) NSMutableArray *array4;
@property (retain) NSMutableArray *array1b;
@property (retain) NSMutableArray *array1c;
@property (retain) NSMutableDictionary *rows;
@property (retain) NSMutableDictionary *rows2;
@property (retain) NSMutableArray *extraDict;
@property (retain) NSMutableArray *extraDict2;

@property (copy) NSString *snapshots;

@property BOOL pressedPause;
@property BOOL pressedPauseBefore;

- (IBAction) controlTextDidEndEditing:(id)sender;
- (IBAction) fireUpActivityMonitor:(id)sender;
- (IBAction) togglePause:(id)sender;
- (IBAction) removeSnapshot:(id)sender;
- (IBAction) addSnapshot:(id)sender;

- (void) updateActivityMonitorSavesArray;
- (void) populateTable:timer;
- (void) pauseTimer:timer;
- (void) resumeTimer:timer;
- (void) closeaTableWindow:(id)sender;


+ (id) sharedManager;

@end
