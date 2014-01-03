//
//  ActivityMonitor.m
//  ActivityMonitor
//
//  Created by John on 26/04/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ActivityMonitor.h"
#import "Snapshots.h"

@implementation ActivityMonitor

@synthesize pressedPause;
@synthesize pressedPauseBefore;
@synthesize closeButton;

@synthesize myArrayController;
@synthesize myArrayController2;
@synthesize timer = _timer;

@synthesize array1 = _array1;
@synthesize array2 = _array2;
@synthesize array3 = _array3;
@synthesize array4 = _array4;
@synthesize array1b = _array1b;
@synthesize array1c = _array1c;
@synthesize rows = _rows;
@synthesize rows2 = _rows2;


- (id)init {
    if (self = [super init]) {
        NSButton *closey = [aTableWindow standardWindowButton:NSWindowCloseButton];
        [closey setAction:@selector(closeaTableWindow:)];
        
        
        // ---------> Get the data for array1
        NSTask *ls1=[[NSTask alloc] init];
        NSPipe *pipe1=[[NSPipe alloc] init];
        NSFileHandle *handle1;
        NSString *string1;
        NSString* resourcePath1=[[NSBundle mainBundle] resourcePath];
        NSString* url1=[[NSString alloc] initWithString:resourcePath1];
        url1=[url1 stringByAppendingPathComponent:@"AMRAM.sh"];
        
        [ls1 setLaunchPath:url1];
        [ls1 setStandardOutput:pipe1];
        handle1=[pipe1 fileHandleForReading];
        [ls1 launch];
        string1=[[NSString alloc] initWithData:[handle1 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        NSMutableArray *array1 = [[string1 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
        
        NSMutableArray *array1alt = [NSMutableArray array];
        
        for (NSString *strNum in array1) {
            NSNumberFormatter *doubleValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
            [doubleValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
            [doubleValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:2];
            NSNumber *number = @([strNum floatValue]);
            [doubleValueWithMaxTwoDecimalPlaces stringFromNumber:number];

            [array1alt addObject:number];
        }
        
        // ---------> Get the data for array2
        NSTask *ls2=[[NSTask alloc] init];
        NSPipe *pipe2=[[NSPipe alloc] init];
        NSFileHandle *handle2;
        NSString *string2;
        NSString* resourcePath2=[[NSBundle mainBundle] resourcePath];
        NSString* url2=[[NSString alloc] initWithString:resourcePath2];
        url2=[url2 stringByAppendingPathComponent:@"AMCPU.sh"];
        
        [ls2 setLaunchPath:url2];
        [ls2 setStandardOutput:pipe2];
        handle2=[pipe2 fileHandleForReading];
        [ls2 launch];
        string2=[[NSString alloc] initWithData:[handle2 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        NSMutableArray *array2 = [[string2 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
        
        
        // ---------> Get the data for array3
        NSTask *ls3=[[NSTask alloc] init];
        NSPipe *pipe3=[[NSPipe alloc] init];
        NSFileHandle *handle3;
        NSString *string3;
        NSString* resourcePath3=[[NSBundle mainBundle] resourcePath];
        NSString* url3=[[NSString alloc] initWithString:resourcePath3];
        url3=[url3 stringByAppendingPathComponent:@"AMNice.sh"];
        
        [ls3 setLaunchPath:url3];
        [ls3 setStandardOutput:pipe3];
        handle3=[pipe3 fileHandleForReading];
        [ls3 launch];
        string3=[[NSString alloc] initWithData:[handle3 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        NSMutableArray *array3 = [[string3 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
        
        
        // ---------> Get the data for array4
        NSTask *ls4=[[NSTask alloc] init];
        NSPipe *pipe4=[[NSPipe alloc] init];
        NSFileHandle *handle4;
        NSString *string4;
        NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
        NSString* url4=[[NSString alloc] initWithString:resourcePath4];
        url4=[url4 stringByAppendingPathComponent:@"AMProcesses.sh"];
        
        [ls4 setLaunchPath:url4];
        [ls4 setStandardOutput:pipe4];
        handle4=[pipe4 fileHandleForReading];
        [ls4 launch];
        string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
        

        NSMutableArray *rows = [NSMutableArray array];
        
        for (NSUInteger i = 0; i < array1alt.count && i < array2.count && i < array3.count && i < array4.count; i++)
        {
            
            NSMutableDictionary *row = [NSMutableDictionary dictionary];
            [row setObject:[array1alt objectAtIndex:i] forKey:@"RAM"];
            [row setObject:[array2 objectAtIndex:i] forKey:@"CPU"];
            [row setObject:[array3 objectAtIndex:i] forKey:@"Nice"];
            [row setObject:[array4 objectAtIndex:i] forKey:@"Process"];
            [rows addObject:row];
        }
    }
    return self;
}

# pragma mark - Populate Table
- (void)populateTable:(id)sender
{
    // ---------> Get the data for array1
    NSTask *ls1=[[NSTask alloc] init];
    NSPipe *pipe1=[[NSPipe alloc] init];
    NSFileHandle *handle1;
    NSString *string1;
    NSString* resourcePath1=[[NSBundle mainBundle] resourcePath];
    NSString* url1=[[NSString alloc] initWithString:resourcePath1];
    url1=[url1 stringByAppendingPathComponent:@"AMRAM.sh"];
    
    [ls1 setLaunchPath:url1];
    [ls1 setStandardOutput:pipe1];
    handle1=[pipe1 fileHandleForReading];
    [ls1 launch];
    string1=[[NSString alloc] initWithData:[handle1 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    NSMutableArray *array1 = [[string1 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    NSMutableArray *array1alt = [NSMutableArray array];
    
    for (NSString *strNum in array1) {
        NSNumberFormatter *doubleValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
        [doubleValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
        [doubleValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:2];
        NSNumber *number = @([strNum floatValue]);
        [doubleValueWithMaxTwoDecimalPlaces stringFromNumber:number];

        [array1alt addObject:number];
    }
    
    // ---------> Get the data for array2
    NSTask *ls2=[[NSTask alloc] init];
    NSPipe *pipe2=[[NSPipe alloc] init];
    NSFileHandle *handle2;
    NSString *string2;
    NSString* resourcePath2=[[NSBundle mainBundle] resourcePath];
    NSString* url2=[[NSString alloc] initWithString:resourcePath2];
    url2=[url2 stringByAppendingPathComponent:@"AMCPU.sh"];
    
    [ls2 setLaunchPath:url2];
    [ls2 setStandardOutput:pipe2];
    handle2=[pipe2 fileHandleForReading];
    [ls2 launch];
    string2=[[NSString alloc] initWithData:[handle2 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    NSMutableArray *array2 = [[string2 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Get the data for array3
    NSTask *ls3=[[NSTask alloc] init];
    NSPipe *pipe3=[[NSPipe alloc] init];
    NSFileHandle *handle3;
    NSString *string3;
    NSString* resourcePath3=[[NSBundle mainBundle] resourcePath];
    NSString* url3=[[NSString alloc] initWithString:resourcePath3];
    url3=[url3 stringByAppendingPathComponent:@"AMNice.sh"];
    
    [ls3 setLaunchPath:url3];
    [ls3 setStandardOutput:pipe3];
    handle3=[pipe3 fileHandleForReading];
    [ls3 launch];
    string3=[[NSString alloc] initWithData:[handle3 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    NSMutableArray *array3 = [[string3 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Get the data for array4
    NSTask *ls4=[[NSTask alloc] init];
    NSPipe *pipe4=[[NSPipe alloc] init];
    NSFileHandle *handle4;
    NSString *string4;
    NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
    NSString* url4=[[NSString alloc] initWithString:resourcePath4];
    url4=[url4 stringByAppendingPathComponent:@"AMProcesses.sh"];
    
    [ls4 setLaunchPath:url4];
    [ls4 setStandardOutput:pipe4];
    handle4=[pipe4 fileHandleForReading];
    [ls4 launch];
    string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];

    
    NSMutableArray *rows = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < array1alt.count && i < array2.count && i < array3.count && i < array4.count; i++)
    {
        
        NSMutableDictionary *row = [NSMutableDictionary dictionary];
        [row setObject:[array1alt objectAtIndex:i] forKey:@"RAM"];
        [row setObject:[array2 objectAtIndex:i] forKey:@"CPU"];
        [row setObject:[array3 objectAtIndex:i] forKey:@"Nice"];
        [row setObject:[array4 objectAtIndex:i] forKey:@"Process"];
        [rows addObject:row];
        
    }

    [myArrayController setContent:rows];
    [bTableView reloadData];
}

-(IBAction)controlTextDidEndEditing:(id)sender {
    if ([[[self mySearchField] stringValue] isEqualToString:@""]) {
        
        NSPredicate *filter = [NSPredicate predicateWithFormat:@"(Process contains[cd] Process)"];
        [myArrayController setFilterPredicate: filter];
        
    } else {
        NSString *_searchString = [[self mySearchField] stringValue];
        
        NSPredicate *_searchResults = [NSPredicate predicateWithFormat:@"(Process contains[cd] %@)", _searchString];
        [myArrayController setFilterPredicate: _searchResults];
    }    
}

-(void)awakeFromNib
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.85
                                                   target:self
                                                 selector:@selector(populateTable:)
                                                 userInfo:nil
                                                  repeats:YES];
}



# pragma mark - Update Activity Monitor Saves Array

-(void)updateActivityMonitorSavesArray
{
    NSPropertyListFormat format;
    
    NSString *errorDesc = nil;
    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.ActivityMonitorSaves.plist" stringByExpandingTildeInPath];
    
    NSData* data = [NSData dataWithContentsOfFile:path];
    
    NSMutableDictionary *temp = (NSMutableDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:data
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    
    
    NSLog(@"temp is: %@", temp);
            
    NSMutableDictionary *array2c = [temp objectForKey:@"Snapshots"];
    NSMutableArray *array2cCPU = [array2c objectForKey:@"CPU"];
    NSLog(@"array2c is: %@", array2c);
    NSLog(@"array2cCPU is: %@", array2cCPU);
        
    
    NSMutableArray *extraDict = nil;
    NSMutableArray *extraDict2 = [NSMutableArray array];    
    
    for (NSMutableDictionary *item in array2c)
    {
        [extraDict2 addObject:item];
        [extraDict addObject:extraDict2];
    }
    
    NSMutableArray *rows2 = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < extraDict2.count; i++)
    {
        NSMutableDictionary *row2 = [NSMutableDictionary dictionary];
        [row2 setObject:[NSString stringWithFormat:@"%@", [extraDict2 objectAtIndex:i]] forKey:@"snapshot"];
        [rows2 addObject:row2];
    }

    
    [myArrayController2 setContent:rows2];
    [aTableView reloadData];
}


# pragma mark - Fire Up Activity Monitor
-(IBAction)fireUpActivityMonitor:(id)sender
{
    [aTableWindow makeKeyAndOrderFront:self];
    [self resumeTimer:_timer];
    [self updateActivityMonitorSavesArray];
//    [myArrayController2 setContent:array1b];
    [aTableView reloadData];
}


# pragma mark - Timer
NSDate *pauseStart, *previousFireDate;

-(void) pauseTimer:timer {
    pauseStart = [NSDate dateWithTimeIntervalSinceNow:0];
    previousFireDate = [timer fireDate];
    [timer setFireDate:[NSDate distantFuture]];
}

-(void) resumeTimer:timer {
    float pauseTime = -1*[pauseStart timeIntervalSinceNow];
    [timer setFireDate:[previousFireDate initWithTimeInterval:pauseTime sinceDate:previousFireDate]];
}

-(IBAction) togglePause:(id)sender
{
    if (pressedPauseBefore == 0)
    {
        [sender setTitle:@"Unpause"];
        [self pauseTimer:_timer];
//        NSLog(@"Don't do the timer.");
        pressedPauseBefore = 1;
    } else {
        [sender setTitle:@"Pause"];
        [self resumeTimer:_timer];
//        NSLog(@"Do the timer.");
        pressedPauseBefore = 0;
    }
}

# pragma mark - Snapshots
-(IBAction) addSnapshot:(id)sender
{
    NSPropertyListFormat format;
    
    NSString *errorDesc = nil;
    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.ActivityMonitorSaves.plist" stringByExpandingTildeInPath];    
    
    NSData* data = [NSData dataWithContentsOfFile:path];

    NSMutableDictionary *temp = (NSMutableDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:data
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    
    NSMutableArray *array1c = [temp objectForKey:@"ActivityMonitorSaves"];
    
//    NSUInteger *newSnapshotNr = [array1c count] +1;
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@" dd MMMM YYYY,  HH:MM:SS"];
    NSString *str = [NSString stringWithFormat:@"%@", [formatter stringFromDate:date]];
    
    
    [array1c addObject:str];
    
    [temp setObject:array1c forKey:@"ActivityMonitorSaves"];
    [temp writeToFile:path atomically:YES];
        
    
    [self updateActivityMonitorSavesArray];
    [bTableView reloadData];
}
    
    
    
-(IBAction) removeSnapshot:(id)sender
{
    NSInteger row = [bTableView selectedRow];
    [bTableView abortEditing];
    
    NSPropertyListFormat format;
    
    NSString *errorDesc = nil;
    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.ActivityMonitorSaves.plist" stringByExpandingTildeInPath];
    
    NSData* data = [NSData dataWithContentsOfFile:path];
    
    NSMutableDictionary *temp = (NSMutableDictionary *)[NSPropertyListSerialization
                                                        propertyListFromData:data
                                                        mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                        format:&format
                                                        errorDescription:&errorDesc];
    
    
    NSMutableArray *array1c = [temp objectForKey:@"ActivityMonitorSaves"];
    
    if (row != -1)
        [array1c removeObjectAtIndex:row];
    
    [temp setObject:array1c forKey:@"ActivityMonitorSaves"];
    [temp writeToFile:path atomically:YES];
    
    [self updateActivityMonitorSavesArray];
    [bTableView reloadData];
}

# pragma mark
- (void)closeaTableWindow:(id)sender {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"ActivityMonitorSaves.plist"];
//    
//    [array1b writeToFile:filePath atomically:YES];
    
    
//    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.ActivityMonitorSaves.plist" stringByExpandingTildeInPath];
//    
//    BOOL PrefsExist=[[NSFileManager defaultManager] fileExistsAtPath:path];
//    
//    NSLog(@"PrefsExist is: %d", PrefsExist);
//    
//    NSMutableDictionary *dictionaryPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
//    
//    id ActivityMonitorSaves = [dictionaryPlist objectForKey:@"ActivityMonitorSaves"];
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error;
//    
//    
//    if (PrefsExist == 0)
//    {
//        NSString *tessdataPath = [[NSBundle mainBundle] pathForResource:@"com.USE-Software.Promus.ActivityMonitorSaves" ofType:@"plist"];
//        [fileManager copyItemAtPath:tessdataPath toPath:path error:&error];
//    } else
//    {
//        
//        id *ActivityMonitorSaves = [[ActivityMonitorSaves valueForKey:@"ActivityMonitorSaves"] objectValue];
//        
//        [array1b writeToFile:path atomically:YES];
//        
//        NSLog(@"ActivityMonitorSaves is: %@", ActivityMonitorSaves);
//    }
    
    
    [closeButton setTarget:self];
    [closeButton setAction:@selector(closeaTableWindow:)];
    
    [aTableWindow standardWindowButton:NSWindowCloseButton];
    
    [self pauseTimer:_timer];
//    [self.timer invalidate];
//    self.timer = nil;
    [self->aTableWindow close];
}

@end
