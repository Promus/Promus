//
//  Tasks.m
//  Promus
//
//  Created by John on 20/05/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks

- (IBAction) BatchTask:(id)sender;
{        
//    NSString *path = [@"~/Library/Preferences/com.USE-Software.Promus.plist" stringByExpandingTildeInPath];
//    
//    BOOL PrefsExist=[[NSFileManager defaultManager] fileExistsAtPath:path];
//    
//    NSLog(@"PrefsExist is: %d", PrefsExist);
//    
//    NSMutableDictionary *dictionaryPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
//    
//    id Batch = [dictionaryPlist valueForKey:@"Batch"];
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error;
//    
//    // # Most BOOL's do not need a pointer type
    BOOL BatchAll = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchAll"];
    BOOL BatchClean = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchClean"];
    BOOL BatchExtraTasks = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchExtraTasks"];
    BOOL BatchPerformPeriodicTasks = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchPerformPeriodicTasks"];
    BOOL BatchRepairPermissions = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchRepairPermissions"];
    BOOL BatchSendReport = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchSendReport"];
    BOOL BatchUpdatePrebindings = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchUpdatePrebindings"];
    BOOL BatchVerifyPreferences = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchVerifyPreferences"];
                    
    NSString *BatchHotKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"BatchClear"];
    
    //  Set up NSUserDefaults for Cache Cleaning Operations
    BOOL CCBrowsers = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesBrowsers"];
    
    BOOL CCCoreDumpFiles = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesCoreDumpFiles"];
    BOOL CCDockIcons = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesDockIcons"];
    BOOL CCKernelExtensions = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesKernelExtensions"];
    BOOL CCLaunchServices = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesLaunchServices"];
    BOOL CCLibrary = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesLibrary"];
    BOOL CCLookupd = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesLookupd"];
    BOOL CCPreferencePanes = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesPreferencePanes"];
    BOOL CCSystem = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesSystem"];
    BOOL CCUser = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesUser"];
    BOOL CCAll = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanCachesAll"];
//
//    
////    NSFileManager *fileMgr = [NSFileManager defaultManager];
////    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:directory error:nil];
////    for (NSString *filename in fileArray)  {
////        
////        [fileMgr removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
////    }
//
//    
//    
//    //  All Caches
//    NSString *AllCaches = [@"~/Library/Caches" stringByExpandingTildeInPath];
//    
//    //  Browser Caches
//    NSString *SafariCache = [@"~/Library/Caches/com.apple.Safari" stringByExpandingTildeInPath];
//    NSString *ChromeCache = [@"~/Library/Caches/com.google.Chrome" stringByExpandingTildeInPath];
//    NSString *FireFoxCache = [@"~/Library/Caches/FireFox" stringByExpandingTildeInPath];
//    
//    
//    //  Set up BatchCleanBrowsersArray
//    NSArray *BatchCleanBrowsersArray = [NSArray arrayWithObjects:SafariCache, ChromeCache, FireFoxCache, nil];
//    
//    if (BatchClean == 1 && CCBrowsers == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
////            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
////    if (BatchClean == 1 && CCCoreDumpFiles == 1)
////    {
////            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
////                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
////                                                    destination:@""
////                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
////                                                            tag:nil];
////    }
//    
//    if (BatchClean == 1 && CCDockIcons == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCKernelExtensions == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCLaunchServices == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCLibrary == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCLookupd == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCPreferencePanes == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCSystem == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCUser == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }
//    
//    if (BatchClean == 1 && CCAll == 1)
//    {
//        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
//        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
//            
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//            
//        }
//    }


}

@end
