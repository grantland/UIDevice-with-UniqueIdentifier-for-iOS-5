//
//  NSString+CryptoAddition.m
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import "NSString+CryptoAddition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Crypto)

- (NSString *) stringFromMD5{

    if(self == nil || [self length] == 0)
        return nil;

    const char *value = [self UTF8String];

    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);

    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }

#if __has_feature(objc_arc)
    return outputString;
#else
    return [outputString autorelease];
#endif
}

- (NSString *) stringFromSHA1{

    if(self == nil || [self length] == 0)
        return nil;

    const char *value = [self UTF8String];

    unsigned char outputBuffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(value, strlen(value), outputBuffer);

    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_SHA1_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }

#if __has_feature(objc_arc)
    return outputString;
#else
    return [outputString autorelease];
#endif
}

@end
