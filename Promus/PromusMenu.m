//  PromusMenu.m
//  Promus
//  Copyright © 2013 by Johannes Frotscher (Date: 23 Mar 2013).

#import <mach/mach.h>
#import <mach/mach_host.h>
#import <Foundation/Foundation.h>

#import "PromusMenu.h"
#import "PreferencesController.h"
#import "MenuCalls.h"


@implementation PromusMenu
- (void)awakeFromNib
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[statusItem setTitle:[NSString stringWithFormat:@" Promus"]];
	[statusItem setImage:[NSImage imageNamed:@"StatusMenuIcon.tiff"]];
	[statusItem setHighlightMode:YES];
	[statusItem setMenu:theMenu];
	[statusItem setEnabled:YES];

	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(datetimeThisBloodyFct) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(uptimeThisBloodyFct) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(ipaddressThisBloodyFct) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(cpuusageThisBloodyFct) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(temperatureThisBloodyFct) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(usedspaceThisBloodyFct) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(freeMemThisBloodyFct) userInfo:nil repeats:YES];
	

	NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"dd MMM, hh:mm"];
    NSString *string1=[NSString stringWithFormat:@"Date:             %12@",[DateFormatter stringFromDate:[NSDate date]]];
	[Item1 setTitle:string1];

    NSTimeInterval uptime = [[NSProcessInfo processInfo] systemUptime];
    NSString *string2=[NSString stringWithFormat:@"Uptime:              %6.2f days", uptime/(60*60*24)];
	[Item2 setTitle:string2];
	
    NSArray *array3 = [[NSHost currentHost] addresses];
    NSString *string3=[NSString stringWithFormat:@"IP:              %12@", [array3 objectAtIndex:1]];
	[Item3 setTitle:string3];

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
	[Item4 setTitle:string4];
	
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
	[Item5 setTitle:string5];
	
    float freeSpace = 0.0f;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary) {
        NSNumber *fileSystemFreeSizeInBytes = [dictionary objectForKey: NSFileSystemFreeSize];
        freeSpace = [fileSystemFreeSizeInBytes floatValue];
    }
    NSString *string6=[NSString stringWithFormat:@"Space:              %4.2f GB free", freeSpace/(1024*1024*1024)];
    [Item6 setTitle:string6];
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
		NSLog(@"Failed to fetch vm statistics");
    }
    /* Stats in bytes */
    natural_t mem_free = vm_stat.free_count *pagesize;
    NSString *string7=[NSString stringWithFormat:@"RAM:               %4u MB free", mem_free/(1024*1024)];
    [Item7 setTitle:string7];
}

-(void)datetimeThisBloodyFct
{
	NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"dd MMM, hh:mm"];
    NSString *string1=[NSString stringWithFormat:@"Date:             %12@",[DateFormatter stringFromDate:[NSDate date]]];
	[Item1 setTitle:string1];
}
	
-(void)uptimeThisBloodyFct
{
    NSTimeInterval uptime = [[NSProcessInfo processInfo] systemUptime];
    NSString *string2=[NSString stringWithFormat:@"Uptime:              %6.2f days", uptime/(60*60*24)];
	[Item2 setTitle:string2];
}

-(void)ipaddressThisBloodyFct
{
    NSArray *array3 = [[NSHost currentHost] addresses];
    NSString *string3=[NSString stringWithFormat:@"IP:              %12@", [array3 objectAtIndex:1]];
	[Item3 setTitle:string3];
}	

-(void)cpuusageThisBloodyFct
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
	[Item4 setTitle:string4];
}

-(void)temperatureThisBloodyFct
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
	[Item5 setTitle:string5];
}

-(void)usedspaceThisBloodyFct
{
        float freeSpace = 0.0f;
        NSError *error = nil;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
        
        if (dictionary) {
            NSNumber *fileSystemFreeSizeInBytes = [dictionary objectForKey: NSFileSystemFreeSize];
            freeSpace = [fileSystemFreeSizeInBytes floatValue];
        }
        NSString *string6=[NSString stringWithFormat:@"Space:              %4.2f GB free", freeSpace/(1024*1024*1024)];
    [Item6 setTitle:string6];
}

-(void)freeMemThisBloodyFct;
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }
    /* Stats in bytes */
    natural_t mem_free = vm_stat.free_count *pagesize;
    NSString *string7=[NSString stringWithFormat:@"RAM:              %4u MB free", mem_free/(1024*1024)];
    [Item7 setTitle:string7];
}

//- (IBAction)checkTabs:(id)sender
//{
//	-(void):(NSTabView *)tabView [didSelectTabViewItem:(NSTabViewItem *)NetworkTab]
//	{
//		int tabSelection;
//		[tabView selectTabViewItem:[tabView tabViewItemAtIndex:1]]
//		if (tabSelection == 0)
//			{
//		NSString *urlstr = [NSString stringWithFormat:@"LineGraphHTMLSnippet.html"];
//		NSURL *url = [NSURL URLWithString:urlstr];
//		[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
//			}
//	}
//}


@end