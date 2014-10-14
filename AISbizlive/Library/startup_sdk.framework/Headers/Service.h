//
//  Service.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 9/4/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionProcess.h"
#import "FungusParameter.h"
#import "ResponseStatus.h"
#import "FungusUtilities.h"
#import "FungusDebugger.h"
#import "FungusError.h"
#import "FungusService.h"
#import "FungusSecurity.h"
#import "Utility.h"

@interface Service : NSObject <ConnectProcessDelegate>
{
    ConnectionProcess *connection;
    
}

@property (nonatomic, strong)NSString *orderRef;
@property (nonatomic, strong)NSString *orderID;

- (void)callbackRespond:(ConnectResponse *)response;

@end
