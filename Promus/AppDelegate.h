//
//  AppDelegate.h
//  Promus
//
//  Created by John on 11/12/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LogNavigatorWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) LogNavigatorWindowController *logsWindowController;

- (IBAction) openConsole:(id)sender;

@end
