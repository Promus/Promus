//
//  Tasks.h
//  Promus
//
//  Created by John on 20/05/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject
{
    IBOutlet NSProgressIndicator *connectingProgress;
}

-(void)buttonPressedWithSound:(id)sender;

- (IBAction) BatchTask:(id)sender;
- (IBAction) Clean:(id)sender;
- (IBAction) SendReport:(id)sender;

@end
