//
//  ConnectionProcess.h
//  FungusLibrary
//
//  Created by Vasin Charoensuk on 11/20/55 BE.
//  Copyright (c) 2555 AIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ConnectServer.h"
#import "ResponseStatus.h"

@class ConnectionProcess;
@protocol ConnectProcessDelegate <NSObject>

//-(void)callbackRespond;
- (void)callbackRespond:(NSDictionary *)response;
//-(void)connectionStart:(ConnectProcess *)sender;
//-(void)connectionProgress:(ConnectProcess *)sender;
//-(void)connectionSuccess:(ConnectProcess *)sender;
//-(void)connectionFail:(ConnectProcess *)sender;
- (void)connectionError:(ResponseStatus *)responseStatus;

@end


@interface ConnectionProcess : NSObject<ConnectServerDelegate>
{
    ConnectServer *connServer;
    NSDictionary *responseDictionary;
    
    UIAlertView *av;
}


@property (nonatomic, strong) id<ConnectProcessDelegate> connectProcessDelegate;

-(void)connect:(NSString *)urlService withData:(NSData *)postData requestHeader:(NSMutableURLRequest *)requestHeader;

@end
