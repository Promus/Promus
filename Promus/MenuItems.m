//
//  MenuCalls.m
//  Promus
//
//  Created by John on 26/04/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <mach/mach.h>
#import "MenuItems.h"
#import "Menulet.h"

@implementation MenuItems

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
