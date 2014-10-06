//
//  FungusSecurity.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/7/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FungusSecurity : NSObject

+(void)setDecryptKeyData:(NSData *)decryptKeyData;
+(void)setEncryptKeyData:(NSData *)encryptKeyData;

+(void) setEncryptKey: (unsigned char *) key;
+(void) setDecryptKey: (unsigned char *) key;
+(void) setInitialVector: (unsigned char *) iv;

+(NSData *)getFungusEncryptData:(NSData *)plainText;
//+(NSString *)getFungusDecryptData:(NSData *)cipherText;
+(NSData *)getFungusDecryptData:(NSData *)cipherText;
+(NSData*)EncryptData:(NSData*)plainText;

+(NSData *)getBase64DataWithRequestData:(NSData *)data;
@end
