//
//  Keychain.m
//  Promus
//
//  Created by John on 27/12/2013.
//  Copyright (c) 2013 USE-Software. All rights reserved.
//

#import "Keychain.h"
#import "SSKeychain.h"


@implementation Keychain

- (id) accountChecker:(NSArray *)allKeychainAccounts
{
    return [[self class] allAccounts];
}

@end
