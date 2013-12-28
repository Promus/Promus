//
//  Snapshots.m
//  PromusActivityMonitor
//
//  Created by John on 23/05/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import "Snapshots.h"
#import <time.h>

@implementation Snapshots

@synthesize snapshot;

- (id)init
{
    self = [super init];
    if (self) {
        
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        
//        NSLocale *myLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
//        [dateFormatter setLocale:myLocale];
//        
//        time_t currentTime = time(NULL);
//        struct tm timeStruct;
//        localtime_r(&currentTime, &timeStruct);
//        char buffer[20];
//        NSString *theTime = strftime(buffer, 20, "%d-%m-%Y %H:%M", &timeStruct);
//        
//        NSLog(@"theTime is: %@", theTime);
        snapshot = (@"Snapshot");
    }
    
    return self;
}

@end
