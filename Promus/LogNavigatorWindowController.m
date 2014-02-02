//
//  LogNavigatorWindowController.m
//  Log Navigator with Controller
//
//  Created by John on 29/01/2014.
//  Copyright (c) 2014 USE-Software. All rights reserved.
//

#import "LogNavigatorWindowController.h"

@interface LogNavigatorWindowController ()

@end

@implementation LogNavigatorWindowController

@synthesize logsTableView;
@synthesize logsTextView;

// # Custom initialization is not necessary in this program
//- (id)init
//{
//    self = [super init];
//    
//    if (self)
//    {
//        // Initialization code here.
//    }
//    
//    return self;
//}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self myDirectoryLogFunction];
}

- (void) myDirectoryLogFunction
{
    //    NSLog(@"This is the log");
    
    //    [logsScrollViewTextView setString:@"Log Preview"];
    
    // # This is a setter
    NSString *path1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Logs/"];
    NSString *path2 = @"/Library/Logs/";
    
    
    filePaths1 = [NSMutableArray array];
    filePaths2 = [NSMutableArray array];
    
    // # The old way, without subpaths:
    //   NSArray *directoryList1 = [[[NSFileManager defaultManager] contentsOfDirectoryAtPath:path1 error:nil]
    //                              pathsMatchingExtensions:[NSArray arrayWithObjects:@"log", nil]];
    directoryList1 = [[[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path1 error:nil]
                      pathsMatchingExtensions:[NSArray arrayWithObjects:@"log", nil]];
    
    // # As first element in array is at place 0, there is no need for "<=" but instead "<":
    for (NSUInteger i = 0; i < directoryList1.count; i++)
    {
        // # This is a getter
        [filePaths1 addObject:[NSHomeDirectory() stringByAppendingFormat:@"/Library/Logs/%@", [directoryList1 objectAtIndex:i]]];
    }
    //    NSLog(@"filePaths1 contains: %@", filePaths1);
    
    directoryList2 = [[[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path2 error:nil]
                      pathsMatchingExtensions:[NSArray arrayWithObjects:@"log", nil]];
    
    for (NSUInteger i = 0; i < directoryList2.count; i++)
    {
        [filePaths2 addObject:[NSString stringWithFormat:@"/Library/Logs/%@", [directoryList2 objectAtIndex:i]]];
    }
    
    // # For the array to be modifiable, it first needs to be initialized, no compiler warning, but it would be empty otherwise
    directoryList = [NSMutableArray array];
    [directoryList addObjectsFromArray:filePaths1];
    [directoryList addObjectsFromArray:filePaths2];
    //    NSLog(@"directoryList contains: %@", directoryList);
    
    //    NSLog(@"%@", directoryList);
    
    NSMutableArray *rows = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < directoryList.count; i++)
    {
        //        NSMutableDictionary *row = [NSMutableDictionary dictionary];
        //
        //        [row setObject:[directoryList objectAtIndex:i] forKey:@"Logs"];
        
        //        NSMutableDictionary *sample6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"Check", nil];
        
        //        [rows2 addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[directoryList objectAtIndex:i], @"Logs", [NSNumber numberWithBool:NO], @"Check", nil]];
        
        // # needs to get bound somehow to array controller and NSUserDefaults for a checkbox cell
        [rows addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[[directoryList objectAtIndex:i] lastPathComponent], @"Logs", nil]];
        
        //        [[NSUserDefaults standardUserDefaults] setValue:rows2 forKey:@"MixedValues"];
        
        
        
        
        //        NSMutableDictionary *row2 = [NSMutableDictionary dictionary];
        //        [row2 setObject:[directoryList objectAtIndex:i] forKey:@"Check"];
        
        //        [row setObject:[directoryList objectAtIndex:i] forKey:@"Checkbox"];
        //        [imgArrayController addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed: [NSString stringWithFormat:@"%@" ,fileName]], @"image", [NSString stringWithFormat:@"%@" ,fileName], @"filename", @"YES", @"check1", nil]];
        
        //        [rows addObject:row];
    }
    
    //    NSLog(@"rows is: %@", rows);
    
    [_LogListController setContent:rows];
    [logsTableView reloadData];
    
    //    NSMutableArray *selectedRowContent = [selectedRowContent objectAtIndex:[logsTableView selectedRow]];
    //
    //    NSLog(@"slectedRowContent is: %@", selectedRowContent);
}

//- (BOOL)tableView:logsTableView shouldSelectRow:(NSInteger)row
//{
//    return YES;
//}

- (void) tableViewSelectionDidChange: (NSNotification *) notification
{
    NSInteger selectedRow = [logsTableView selectedRow];
    
    // # Often for loops aren't necessary, if statements is good for continuing sets of data
    if ([directoryList containsObject:[directoryList objectAtIndex:selectedRow]])
    {
        //        NSLog(@"row is: %lu", selectedRow);
        
        NSString *logContent = [NSString stringWithContentsOfFile:[directoryList objectAtIndex:selectedRow]
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        if (logContent != NULL)
        {
            [logsTextView setString:logContent];
        } else
        {
            [logsTextView setString:@"No permission to read log"];
        }
    }
}


@end
