//
//  ServiceCT01_GetContactList.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseGetContactList.h"
#import <startup_sdk/ServiceBizLive.h>

@protocol GetContactListDelegate <NSObject>

- (void)getContactListSuccess:(ResponseGetContactList *)responseGetContactList;
- (void)getcontactListError:(ResultStatus *)status;

@end

@interface ServiceCT01_GetContactList : BizliveService <ServiceBizLiveDelegate>

@property (nonatomic, assign)id<GetContactListDelegate> getContactListDelegate;

@end
