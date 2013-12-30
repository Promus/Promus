//  PromusMenu.h
//  Promus
//  Copyright © 2013 by Johannes Frotscher (Date: 23 Mar 2013).

#import <Cocoa/Cocoa.h>
#import "Preferences.h"
#import "MenuItems.h"

@interface Menulet : NSObject
{
NSStatusItem *statusItem;
    
IBOutlet NSMenu *theMenu;

IBOutlet NSMenuItem *Item1;
IBOutlet NSMenuItem *Item2;
IBOutlet NSMenuItem *Item3;
IBOutlet NSMenuItem *Item4;
IBOutlet NSMenuItem *Item5;
IBOutlet NSMenuItem *Item6;
IBOutlet NSMenuItem *Item7;

IBOutlet NSWindow *PromusInterface;
}

-(void) datetimeThisBloodyFct;
-(void) uptimeThisBloodyFct;
-(void) ipaddressThisBloodyFct;
-(void) cpuusageThisBloodyFct;
-(void) temperatureThisBloodyFct;
-(void) usedspaceThisBloodyFct;
-(void) freeMemThisBloodyFct;

@end