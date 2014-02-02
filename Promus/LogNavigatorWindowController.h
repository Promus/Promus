//
//  LogNavigatorWindowController.h
//  Log Navigator with Controller
//
//  Created by John on 29/01/2014.
//  Copyright (c) 2014 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LogNavigatorWindowController : NSWindowController
{
    NSArray *directoryList1;
    NSArray *directoryList2;
    NSMutableArray *directoryList;
    NSMutableArray *filePaths1;
    NSMutableArray *filePaths2;
}

//@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *logsTableView;
@property (unsafe_unretained) IBOutlet NSTextView *logsTextView;
@property (assign) IBOutlet NSArrayController *LogListController;
@property (retain) NSMutableArray *logsArray;

- (void) myDirectoryLogFunction;

@end
