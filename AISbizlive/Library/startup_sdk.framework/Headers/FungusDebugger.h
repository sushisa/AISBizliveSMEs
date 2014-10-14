//
//  Debugger.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/21/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FungusDebugger : NSObject

+(BOOL) isOnline;
+(void)log:(NSString *) message;

@end
