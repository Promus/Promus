//
//  AppDelegate.h
//  Promus
//
//  Created by John on 11/12/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// # Class definitions precourse any instantiation
@class LogNavigatorWindowController;
@class BuyBread;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) LogNavigatorWindowController *logsWindowController;
@property (strong) BuyBread *buyBread;

- (IBAction) openConsole:(id)sender;
- (IBAction) buyBreadDialog:(id)sender;

@end
