//
//  Snapshots.h
//  PromusActivityMonitor
//
//  Created by John on 23/05/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Snapshots : NSObject
{
    @private
    NSString *snapshot;
}

@property (copy) NSString *snapshot;
@end
