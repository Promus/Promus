//
//  MenuCalls.m
//  Promus
//
//  Created by John on 26/04/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MenuCalls.h"
#import "PromusMenu.h"

@implementation MenuCalls
@synthesize myArrayController;

//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
//{
//    [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jimmy", @"Name", @"Johns", @"Family", nil]];
//}

//if [NSWindow == aTableWindow]
//{
//    NSTask *task;
//    NSPipe *resultPipe = [[NSPipe alloc] init];
//    
//    task = [[NSTask alloc] init];
//    [task setLaunchPath: @"/bin/sh"];
//    
//    NSArray *arguments;
//    arguments = [NSArray arrayWithObjects: @"-c",
//                 @"ps -ev | awk '{print $12}' | awk 'FNR>1'", nil];
//    [task setArguments: arguments];
//    [task setStandardOutput: resultPipe];
//    [task launch];
//
//    NSData *result = [[resultPipe fileHandleForReading] readDataToEndOfFile];
//    NSString *newStr = [NSString stringWithUTF8String:[result bytes]];
//    
//    //		NSLog(@"Result is: %@", newStr);
//    
//    //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
//    //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
//    
//    NSMutableArray *array = [[newStr componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
//    
//    for (int i = 0; i < [array count]; i++)
//    {
//        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array objectAtIndex:i], @"Name", nil]];
//    }
//}

static MenuCalls *sharedMyManager = nil;

@synthesize array4;


#pragma mark Singleton Methods
+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedManager];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)init {
    if (self = [super init]) {
        NSTask *ls4=[[NSTask alloc] init];
        NSPipe *pipe4=[[NSPipe alloc] init];
        NSFileHandle *handle4;
        NSString *string4;
        NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
        NSString* url4=[[NSString alloc] initWithString:resourcePath4];
        url4=[url4 stringByAppendingPathComponent:@"Processes.sh"];
        
        [ls4 setLaunchPath:url4];
        [ls4 setStandardOutput:pipe4];
        handle4=[pipe4 fileHandleForReading];
        [ls4 launch];
        string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        //    NSData *result4 = [[pipe4 fileHandleForReading] readDataToEndOfFile];
        //
        //    NSLog(@"result4 is: %@", result4);
        
        //    NSString *newStr4 = [NSString stringWithUTF8String:[result4 bytes]];
        
        NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
        
        NSString *searchString = @"TextEdit";
        
        //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"array4 contains %@", searchString];
        //    NSArray *_searchResults = [array4 filteredArrayUsingPredicate:predicate];
        //    NSLog(@"This is the result %@", _searchResults);
        
        NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchString];
        NSArray *beginWithB = [array4 filteredArrayUsingPredicate:bPredicate];
        
        
        NSLog(@"Strings are: %@", beginWithB);
        
    }
    return self;
}


- (IBAction)loadCompanyURL:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"http://www.use-software.uk.tt"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (IBAction)loadMacUpdateURL:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"http://www.macupdate.com/Promus"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (IBAction)loadFeedbackURL:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"http://www.use-software.uk.tt/ContactScript.php"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}


- (IBAction)populateTable:(id)sender
{    
    // ---------> Get the data
    NSTask *ls1=[[NSTask alloc] init];
    NSPipe *pipe1=[[NSPipe alloc] init];
    NSFileHandle *handle1;
    NSString *string1;
    NSString* resourcePath1=[[NSBundle mainBundle] resourcePath];
    NSString* url1=[[NSString alloc] initWithString:resourcePath1];
    url1=[url1 stringByAppendingPathComponent:@"RAM.sh"];
    
    [ls1 setLaunchPath:url1];
    [ls1 setStandardOutput:pipe1];
    handle1=[pipe1 fileHandleForReading];
    [ls1 launch];
    string1=[[NSString alloc] initWithData:[handle1 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    //		NSLog(@"Result is: %@", newStr);
    
    //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
    //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *array1 = [[string1 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Get the data
    NSTask *ls2=[[NSTask alloc] init];
    NSPipe *pipe2=[[NSPipe alloc] init];
    NSFileHandle *handle2;
    NSString *string2;
    NSString* resourcePath2=[[NSBundle mainBundle] resourcePath];
    NSString* url2=[[NSString alloc] initWithString:resourcePath2];
    url2=[url2 stringByAppendingPathComponent:@"CPU.sh"];
    
    [ls2 setLaunchPath:url2];
    [ls2 setStandardOutput:pipe2];
    handle2=[pipe2 fileHandleForReading];
    [ls2 launch];
    string2=[[NSString alloc] initWithData:[handle2 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    //		NSLog(@"Result is: %@", newStr);
    
    //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
    //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *array2 = [[string2 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Get the data
    NSTask *ls3=[[NSTask alloc] init];
    NSPipe *pipe3=[[NSPipe alloc] init];
    NSFileHandle *handle3;
    NSString *string3;
    NSString* resourcePath3=[[NSBundle mainBundle] resourcePath];
    NSString* url3=[[NSString alloc] initWithString:resourcePath3];
    url3=[url3 stringByAppendingPathComponent:@"Nice.sh"];
    
    [ls3 setLaunchPath:url3];
    [ls3 setStandardOutput:pipe3];
    handle3=[pipe3 fileHandleForReading];
    [ls3 launch];
    string3=[[NSString alloc] initWithData:[handle3 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    //		NSLog(@"Result is: %@", newStr);
    
    //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
    //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *array3 = [[string3 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Get the data
    NSTask *ls4=[[NSTask alloc] init];
    NSPipe *pipe4=[[NSPipe alloc] init];
    NSFileHandle *handle4;
    NSString *string4;
    NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
    NSString* url4=[[NSString alloc] initWithString:resourcePath4];
    url4=[url4 stringByAppendingPathComponent:@"Processes.sh"];
    
    [ls4 setLaunchPath:url4];
    [ls4 setStandardOutput:pipe4];
    handle4=[pipe4 fileHandleForReading];
    [ls4 launch];
    string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    //		NSLog(@"Result is: %@", newStr);
    
    //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
    //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    
    // ---------> Clear the data
    [myArrayController removeObjectsAtArrangedObjectIndexes:[NSIndexSet
                                                             indexSetWithIndexesInRange:NSMakeRange(0, [[myArrayController arrangedObjects]
                                                                                                        count])]];
    
    // ---------> Fill with data
//    for (int i = 0; i < [array1 count]; i++)
//    {
//        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array1 objectAtIndex:i], @"RAM", nil]];
//    }
//    for (int j = 0; j < [array2 count]; j++)
//        {
//        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array2 objectAtIndex:j], @"CPU", nil]];
//        }
//    for (int k = 0; k < [array3 count]; k++)
//        {
//        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array3 objectAtIndex:k], @"Nice", nil]];
//        }
//    for (int l = 0; l < [array4 count]; l++)
//        {
//        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array4 objectAtIndex:l], @"Process", nil]];
//        }

    for (int i = 0, j = 0, k = 0, l = 0; i < [array1 count] && j < [array2 count] && k < [array3 count] && l < [array4 count]; i++ && j++ && k++ && l++)
    {
        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array1 objectAtIndex:i], @"RAM", [array2 objectAtIndex:j], @"CPU", [array3 objectAtIndex:k], @"Nice", [array4 objectAtIndex:l], @"Process", nil]];
    }

//    NSString *searchString = @"TextEdit";
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"array4 contains %@", searchString];
//    NSArray *_searchResults = [array4 filteredArrayUsingPredicate:predicate];
//    NSLog(@"This is the result %@", _searchResults);
    
//    int f;
//    for (f = 0; f < [array4 count]; f++)
//    {
//        id myArray2Element = [array4 objectAtIndex:f];
//        NSLog(@"%@", myArray2Element);
//        NSLog(@"%d", [predicate evaluateWithObject:myArray2Element]);
//    }
}

-(IBAction)controlTextDidEndEditing:(id)sender {
    
    NSTask *ls4=[[NSTask alloc] init];
    NSPipe *pipe4=[[NSPipe alloc] init];
    NSFileHandle *handle4;
    NSString *string4;
    NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
    NSString* url4=[[NSString alloc] initWithString:resourcePath4];
    url4=[url4 stringByAppendingPathComponent:@"Processes.sh"];
    
    [ls4 setLaunchPath:url4];
    [ls4 setStandardOutput:pipe4];
    handle4=[pipe4 fileHandleForReading];
    [ls4 launch];
    string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    //    NSData *result4 = [[pipe4 fileHandleForReading] readDataToEndOfFile];
    //
    //    NSLog(@"result4 is: %@", result4);
    
    //    NSString *newStr4 = [NSString stringWithUTF8String:[result4 bytes]];
    
    NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    NSString *searchString = @"TextEdit";
    
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"array4 contains %@", searchString];
    //    NSArray *_searchResults = [array4 filteredArrayUsingPredicate:predicate];
    //    NSLog(@"This is the result %@", _searchResults);
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchString];
    NSArray *beginWithB = [array4 filteredArrayUsingPredicate:bPredicate];
    
    NSLog(@"Strings are: %@", beginWithB);
    
    if ([[[self mySearchField] stringValue] isEqualToString:@""]) {
        bPredicate = [NSPredicate predicateWithFormat: @"SELF == nil"];
    } else {
        [myArrayController removeObjectsAtArrangedObjectIndexes:[NSIndexSet
                                                                 indexSetWithIndexesInRange:NSMakeRange(0, [[myArrayController arrangedObjects]
                                                                                                            count])]];
        
        bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", [[self mySearchField] stringValue]];
        
        NSArray *beginWithC = [array4 filteredArrayUsingPredicate:bPredicate];
        
        NSLog(@"Strings are: %@ yohoo", beginWithC);
        // @"(CPU contains[cd] $value) or (Process contains[cd] $value)" etc...
        
        for (int l = 0; l < [beginWithC count]; l++)
        {
            [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[beginWithC objectAtIndex:l], @"Process", nil]];
        }
        
        
    }
    
}


-(IBAction)fireUpActivityMonitor:(id)sender
{
    [aTableWindow makeKeyAndOrderFront:self];

    
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0
                                          target:self
                                        selector:@selector(populateTable:)
                                        userInfo:nil
                                         repeats:YES];

    
        // ---------> Get the data
        NSTask *ls1=[[NSTask alloc] init];
        NSPipe *pipe1=[[NSPipe alloc] init];
        NSFileHandle *handle1;
        NSString *string1;
        NSString* resourcePath1=[[NSBundle mainBundle] resourcePath];
        NSString* url1=[[NSString alloc] initWithString:resourcePath1];
        url1=[url1 stringByAppendingPathComponent:@"RAM.sh"];
        
        [ls1 setLaunchPath:url1];
        [ls1 setStandardOutput:pipe1];
        handle1=[pipe1 fileHandleForReading];
        [ls1 launch];
        string1=[[NSString alloc] initWithData:[handle1 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        //		NSLog(@"Result is: %@", newStr);
        
        //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
        //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableArray *array1 = [[string1 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];    

    
        // ---------> Get the data
        NSTask *ls2=[[NSTask alloc] init];
        NSPipe *pipe2=[[NSPipe alloc] init];
        NSFileHandle *handle2;
        NSString *string2;
        NSString* resourcePath2=[[NSBundle mainBundle] resourcePath];
        NSString* url2=[[NSString alloc] initWithString:resourcePath2];
        url2=[url2 stringByAppendingPathComponent:@"CPU.sh"];
        
        [ls2 setLaunchPath:url2];
        [ls2 setStandardOutput:pipe2];
        handle2=[pipe2 fileHandleForReading];
        [ls2 launch];
        string2=[[NSString alloc] initWithData:[handle2 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        //		NSLog(@"Result is: %@", newStr);
        
        //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
        //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableArray *array2 = [[string2 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];

    
        // ---------> Get the data
        NSTask *ls3=[[NSTask alloc] init];
        NSPipe *pipe3=[[NSPipe alloc] init];
        NSFileHandle *handle3;
        NSString *string3;
        NSString* resourcePath3=[[NSBundle mainBundle] resourcePath];
        NSString* url3=[[NSString alloc] initWithString:resourcePath3];
        url3=[url3 stringByAppendingPathComponent:@"Nice.sh"];

        [ls3 setLaunchPath:url3];
        [ls3 setStandardOutput:pipe3];
        handle3=[pipe3 fileHandleForReading];
        [ls3 launch];
        string3=[[NSString alloc] initWithData:[handle3 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        //		NSLog(@"Result is: %@", newStr);
        
        //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
        //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableArray *array3 = [[string3 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];

    
        // ---------> Get the data
        NSTask *ls4=[[NSTask alloc] init];
        NSPipe *pipe4=[[NSPipe alloc] init];
        NSFileHandle *handle4;
        NSString *string4;
        NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
        NSString* url4=[[NSString alloc] initWithString:resourcePath4];
        url4=[url4 stringByAppendingPathComponent:@"Processes.sh"];

        [ls4 setLaunchPath:url4];
        [ls4 setStandardOutput:pipe4];
        handle4=[pipe4 fileHandleForReading];
        [ls4 launch];
        string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
        
        //		NSLog(@"Result is: %@", newStr);
        
        //		NSString* pathToFile = [[NSBundle mainBundle] pathForResource: @"quotes" ofType: @"csv"];
        //		NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableArray *array4 = [[string4 componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];

    
        // ---------> Clear the data
        [myArrayController removeObjectsAtArrangedObjectIndexes:[NSIndexSet
                                                                 indexSetWithIndexesInRange:NSMakeRange(0, [[myArrayController arrangedObjects]
                                                                                                            count])]];
    
        // ---------> Fill with data
        //    for (int i = 0; i < [array1 count]; i++)
        //    {
        //        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array1 objectAtIndex:i], @"RAM", nil]];
        //    }
        //    for (int j = 0; j < [array2 count]; j++)
        //        {
        //        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array2 objectAtIndex:j], @"CPU", nil]];
        //        }
        //    for (int k = 0; k < [array3 count]; k++)
        //        {
        //        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array3 objectAtIndex:k], @"Nice", nil]];
        //        }
        //    for (int l = 0; l < [array4 count]; l++)
        //        {
        //        [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array4 objectAtIndex:l], @"Process", nil]];
        //        }
        
        
        for (int i = 0, j = 0, k = 0, l = 0; i < [array1 count] && j < [array2 count] && k < [array3 count] && l < [array4 count]; i++ && j++ && k++ && l++)
        {
            [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[array1 objectAtIndex:i], @"RAM", [array2 objectAtIndex:j], @"CPU", [array3 objectAtIndex:k], @"Nice", [array4 objectAtIndex:l], @"Process", nil]];
        }
}

- (IBAction)closeATableWindow:(id)sender
{
    [aTableWindow close];
}

//-(IBAction)searchATableView
//{
//    NSString *nameToSearch = @"Bob";
//    NSPredicate *catPred = [NSPredicate predicateWithFormat:@"ANY Name == %@", nameToSearch];
//    
//    NSArray *filteredCats = [array4 filteredArrayUsingPredicate:catPred];
//    
//    NSLog(@"%@", filteredCats);
//}


//    [myArrayController addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jimmy", @"Name", @"Johns", @"Family", nil]];
    
    
//NSLog(@"%@", array);

// ----------> Send data to table


//- (IBAction)showConfirmation:(id)sender
//{
//    if ((id)sender = NSMenuItem *Item1)
//    {
//        on clicked affirmative
//            do sender's task
//        end clicked affirmativce
//    }
//}


- (IBAction)copyToClipboardCPUUsage:(id)sender
{
    NSTask *ls4=[[NSTask alloc] init];
    NSPipe *pipe4=[[NSPipe alloc] init];
    NSFileHandle *handle4;
    NSString *string4;
    NSString* resourcePath4=[[NSBundle mainBundle] resourcePath];
    NSString* url4=[[NSString alloc] initWithString:resourcePath4];
    url4=[url4 stringByAppendingPathComponent:@"CPUUsage.sh"];
    [ls4 setLaunchPath:url4];
    [ls4 setStandardOutput:pipe4];
    handle4=[pipe4 fileHandleForReading];
    [ls4 launch];
    string4=[[NSString alloc] initWithData:[handle4 readDataToEndOfFile] encoding:NSASCIIStringEncoding];

    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: string4 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardDateAndTime:(id)sender
{
	NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"dd MMM, hh:mm"];
    NSString *string1=[NSString stringWithFormat:@"%@",[DateFormatter stringFromDate:[NSDate date]]];
    
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: string1 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardUptime:(id)sender
{
    NSTimeInterval uptime = [[NSProcessInfo processInfo] systemUptime];
    NSString *string2=[NSString stringWithFormat:@"%.2f days", uptime/(60*60*24)];
    
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: string2 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardIP:(id)sender
{
    NSArray *array3 = [[NSHost currentHost] addresses];
    NSString *string3=[NSString stringWithFormat:@"%@", [array3 objectAtIndex:1]];
    
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: string3 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardTemps:(id)sender
{
    NSTask *ls5=[[NSTask alloc] init];
    NSPipe *pipe5=[[NSPipe alloc] init];
    NSFileHandle *handle5;
    NSString *string5;
    NSString* resourcePath5=[[NSBundle mainBundle] resourcePath];
    NSString* url5=[[NSString alloc] initWithString:resourcePath5];
    url5=[url5 stringByAppendingPathComponent:@"Temps"];
    [ls5 setLaunchPath:url5];
    [ls5 setStandardOutput:pipe5];
    handle5=[pipe5 fileHandleForReading];
    [ls5 launch];
    string5=[[NSString alloc] initWithData:[handle5 readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: string5 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardFreeSpace:(id)sender
{
    float freeSpace = 0.0f;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];

    if (dictionary) {
        NSNumber *fileSystemFreeSizeInBytes = [dictionary objectForKey: NSFileSystemFreeSize];
        freeSpace = [fileSystemFreeSizeInBytes floatValue];
    }
    NSString *string6=[NSString stringWithFormat:@"%.2f GB", freeSpace/(1024*1024)];

        NSPasteboard *pb = [NSPasteboard generalPasteboard];
        NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
        [pb declareTypes:types owner:self];
        [pb setString: string6 forType:NSStringPboardType];
}

- (IBAction)copyToClipboardFreeRAM:(id)sender
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
    {
        NSLog(@"Failed to fetch vm statistics");
    }
    /* Stats in bytes */
    NSUInteger mem_free = vm_stat.free_count * pagesize;
    NSString *string7=[NSString stringWithFormat:@"%lu MB", mem_free/(1024*1024)];
        NSPasteboard *pb = [NSPasteboard generalPasteboard];
        NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
        [pb declareTypes:types owner:self];
        [pb setString: string7 forType:NSStringPboardType];
}
@end
