//
//  NSString+CryptoAddition.h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Crypto)

- (NSString *) stringFromMD5;
- (NSString *) stringFromSHA1;

@end
