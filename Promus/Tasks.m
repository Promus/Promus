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
    BOOL BatchClean = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchClean"];
    BOOL BatchPerformPeriodicTasks = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchPerformPeriodicTasks"];
    BOOL BatchRepairPermissions = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchRepairPermissions"];
    BOOL BatchSendReport = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchSendReport"];
    BOOL BatchUpdatePrebindings = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchUpdatePrebindings"];
    BOOL BatchVerifyPreferences = [[NSUserDefaults standardUserDefaults] boolForKey:@"BatchVerifyPreferences"];
    
    NSString *BatchHotKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"BatchHotKey"];
    
    if (BatchClean == 1)
    {
        
    }
    
    //  # Set up NSUserDefaults for Cache Cleaning Operations
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

    
    // # Set up NSUserDefaults for Log Cleaning Operations
    BOOL CLCrashReports = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsCrashReports"];
    BOOL CLPrinting = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsPrinting"];
    BOOL CLLinePrinter = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsLinePrinter"];
    BOOL CLInternetNetwork = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsInternetNetwork"];
    BOOL CLLibrary = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsLibrary"];
    BOOL CLKernelPanic = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsKernelPanic"];
    BOOL CLConsole = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsConsole"];
    BOOL CLSecurity = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsSecurity"];
    BOOL CLSystem = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsSystem"];
    BOOL CLMail = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanLogsMail"];
    
    // # Set up NSUserDefaults for History Cleaning Operations
    BOOL CHBrowsers = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesBrowsers"];
    BOOL CHTemporaryItems = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesTemporaryItems"];
    BOOL CHFindIndexes = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesFindIndexes"];
    BOOL CHSafariDownloads = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesSafariDownloads"];
    BOOL CHDVDScripts = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesDVDScripts"];
    BOOL CHFinderPreferences = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesFinderPreferences"];
    BOOL CHDSStores = [[NSUserDefaults standardUserDefaults] boolForKey:@"CleanHistoriesDSStores"];
    
    BOOL CleanHotKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"CleanHotKey"];
    
//    NSFileManager *fileMgr = [NSFileManager defaultManager];
//    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:directory error:nil];
//    for (NSString *filename in fileArray)  {
//        
//        [fileMgr removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
//    }

    
    
    //  All Caches
    NSString *AllCaches = [@"~/Library/Caches" stringByExpandingTildeInPath];
    
    //  Browser Caches
    NSString *SafariCache = [@"~/Library/Caches/com.apple.Safari" stringByExpandingTildeInPath];
    NSString *ChromeCache = [@"~/Library/Caches/com.google.Chrome" stringByExpandingTildeInPath];
    NSString *FireFoxCache = [@"~/Library/Caches/FireFox" stringByExpandingTildeInPath];
    
    
    //  Set up BatchCleanBrowsersArray
    NSArray *BatchCleanBrowsersArray = [NSArray arrayWithObjects:SafariCache, ChromeCache, FireFoxCache, nil];
    
    if (BatchClean == 1 && CCBrowsers == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
//            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
//    if (BatchClean == 1 && CCCoreDumpFiles == 1)
//    {
//            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
//                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
//                                                    destination:@""
//                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
//                                                            tag:nil];
//    }
    
    if (BatchClean == 1 && CCDockIcons == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCKernelExtensions == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];   
        }
    }
    
    if (BatchClean == 1 && CCLaunchServices == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCLibrary == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCLookupd == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCPreferencePanes == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCSystem == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
    if (BatchClean == 1 && CCUser == 1)
    {
        for (int i = 0; i < [BatchCleanBrowsersArray count]; i++)
        {
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:([BatchCleanBrowsersArray objectAtIndex:i]) error:nil];
            
            [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
                                                         source:([[BatchCleanBrowsersArray objectAtIndex:i] stringByDeletingLastPathComponent])
                                                    destination:@""
                                                          files:[NSArray arrayWithObject:[[BatchCleanBrowsersArray objectAtIndex:i] lastPathComponent]]
                                                            tag:nil];
        }
    }
    
//    NSTask *periodicDailyTask = [[NSTask alloc] init];
//    NSPipe *pipe1 = [[NSPipe alloc] init];
//    NSFileHandle *handle1;
//    NSString *resourcePath1 = [[NSBundle mainBundle] resourcePath];
//    NSString *url1 = [[NSString alloc] initWithString:resourcePath1];
//    url1 = [url1 stringByAppendingPathComponent:@"Processes.sh"];
//    
//    [periodicDailyTask setLaunchPath:url1];
//    [periodicDailyTask setStandardOutput:pipe1];
//    handle1 = [pipe1 fileHandleForReading];
//    [periodicDailyTask launch];
    
    if (BatchPerformPeriodicTasks == 1)
    system("security 2>&1 >/dev/null find-generic-password -ga `whoami` | sed 's/password: //g' | sed '1s/^.//' | sed s/.$// | sudo -S periodic daily weekly monthly");
    
    if (BatchSendReport == 1)
    {
        system("uuencode Promus-Analysis-Report.txt Promus-Analysis-Report.txt | mail -s 'Promus Analysis Report' jfrotscher@gmail.com");
    }
    
    [[NSTask launchedTaskWithLaunchPath:@"/bin/mail"
                              arguments:[NSArray array]] waitUntilExit];
    
    BOOL ReportsInternalIPProfile = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsInternalIPProfile"];
    BOOL ReportsExternalIPProfile = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsExternalIPProfile"];
    
    if (ReportsInternalIPProfile == 1)
    {
        system("DD=`ifconfig en1 | grep 'inet ' | awk -F: '{print $1}' | awk '{print $2}` | whois -h whois.geektools.com $DD");
    }
    
    if (ReportsExternalIPProfile == 1)
    {
        system("DD=`curl icanhazip.com` | whois -h whois.geektools.com $DD");
    }
    // # Alternatively this, which is faster, but needs a way to write escape character \< for Objective-C
    // usr/bin/curl -f -s http://checkip.dyndns.org | grep Address | awk  '{print $6}' | cut -d \< -f 1
}

- (IBAction) SendReport:(id)sender
{
    BOOL ReportsSystemProfile = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsSystemProfile"];
    BOOL ReportsInternalIPProfile = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsInternalIPProfile"];
    BOOL ReportsExternalIPProfile = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsExternalIPProfile"];
    BOOL ReportsDuplicateScan = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsDuplicateScan"];
    BOOL ReportsPermissionsVerification = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsPermissionsVerification"];
    BOOL ReportsPreferencesVerification = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReportsPreferencesVerification"];
    
    if (ReportsSystemProfile == 1)
        system("system_profiler > ~/SystemProfile-`date +%d.%m.%y`.txt");
        
    if (ReportsInternalIPProfile == 1)
        system("DD=`ifconfig en1 | grep 'inet ' | awk -F: '{print $1}' | awk '{print $2}` | whois -h whois.geektools.com $DD > ~/InternalIPProfile-`date +%d.%m.%y`.txt");
    
    if (ReportsExternalIPProfile == 1)
        system("DD=`curl icanhazip.com` | whois -h whois.geektools.com $DD > ~/ExternalIPProfile-`date +%d.%m.%y`.txt");
    // # Alternatively this, which is faster, but needs a way to write escape character \< for Objective-C
    // # usr/bin/curl -f -s http://checkip.dyndns.org | grep Address | awk  '{print $6}' | cut -d \< -f 1
    
    if (ReportsDuplicateScan == 1)
    {
        NSTask *duplicateScan = [[NSTask alloc] init];
        NSPipe *pipe = [[NSPipe alloc] init];
        NSFileHandle *handle;
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        NSString *url = [[NSString alloc] initWithString:resourcePath];
        url = [url stringByAppendingPathComponent:@"DuplicateScanner.pl > ~/DuplicateScan-`date +%d.%m.%y`.txt"];
        
        [duplicateScan setLaunchPath:url];
        [duplicateScan setStandardOutput:pipe];
        handle = [pipe fileHandleForReading];
        [duplicateScan launch];
    }
    
    if (ReportsPermissionsVerification == 1)
    {
        system("plutil -s ~/Library/Preferences/*.plist > ~/PreferencesVerfication-`date +%d.%m.%y`.txt");
    }
    
    if (ReportsPermissionsVerification == 1)
    {
        system("diskutil verifyPermissions > ~/PermissionsVerfication-`date +%d.%m.%y`.txt");
    }
}
@end
