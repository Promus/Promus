//
//  Keychain.h
//  Promus
//
//  Created by John on 27/12/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@interface Keychain : NSObject

- (id) accountChecker:(NSArray *)allKeychainAccounts;

@end
