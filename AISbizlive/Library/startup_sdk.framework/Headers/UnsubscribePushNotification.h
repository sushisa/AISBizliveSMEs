//
//  UnsubscribePushNotification.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 9/12/2557 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestService.h"


@protocol UnsubscribePushNotificationDelegate <NSObject>

- (void)unsubscribePushNotificationSuccess;
- (void)unsubscribePushNotificationError:(ResponseStatus *)responseStatus;

@end

@interface UnsubscribePushNotification : RequestService

- (void)setParameterWithAccessToken:(NSString *)accessToken
                          eventName:(NSString *)eventName;

@property (nonatomic, assign)id<UnsubscribePushNotificationDelegate>  delegate;

- (void)fungusRequest;

@end

