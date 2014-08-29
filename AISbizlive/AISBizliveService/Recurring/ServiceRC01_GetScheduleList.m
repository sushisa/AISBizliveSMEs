//
//  ServiceRC01_GetScheduleList.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC01_GetScheduleList.h"

@implementation ServiceRC01_GetScheduleList
@synthesize delegate;

- (void)requestService
{
    [super requestService];
    
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    //################################## Test ##################################
    if (![Admin isOnline]) {
        /*
        responseData = @{RES_KEY_MESSAGE_ID     : @"",
                         RES_KEY_MESSAGE        : @"",
                         RES_KEY_TIME_EXPIRE    : @"",
                         RES_KEY_SEND_TYPE      : @"",
                         RES_KEY_RECEIVER_LIST  : @[@{RES_KEY_GROUP_LIST : @[@{RES_KEY_GROUP_ID: @"1"},
                                                                             @{RES_KEY_GROUP_ID: @"2"}]},
                                                  @{RES_KEY_CONTACT_LIST : @[@{RES_KEY_CONTACT_ID: @"111"},
                                                                             @{RES_KEY_CONTACT_ID: @"222"}]},
                                                  @{RES_KEY_MOBILE_LIST  : @[@{RES_KEY_MOBILE_NO:@"089XXXXXXX"},
                                                                             @{RES_KEY_MOBILE_NO:@"08XXXXXXXX"}]}],
                         RES_KEY_SCHEDULE       : @[@{RES_KEY_START_DATE : @""},
                                                    @{RES_KEY_END_DATE   : @""},
                                                    @{RES_KEY_SEND_TIME  : @"23.30"}],
                         RES_KEY_RECURRING_LIST : @[@{RES_KEY_RECURRING_TYPE : @"0"},
                                                    @{RES_KEY_WEEKLY         : @[@{RES_KEY_DAY_OF_WEEK : @"0"},
                                                                                 @{RES_KEY_DAY_OF_WEEK : @"1"}]},
                                                    @{RES_KEY_MONTHLY        : @[@{RES_KEY_DAY: @"0"},
                                                                                 @{RES_KEY_DAY: @"1"}]}]};
         */
        
        responseData = @{RES_KEY_MESSAGE_ID     : @"",
                         RES_KEY_MESSAGE        : @"",
                         RES_KEY_TIME_EXPIRE    : @"",
                         RES_KEY_SEND_TYPE      : @"",
                         RES_KEY_RECEIVER_LIST  : @{RES_KEY_GROUP_LIST : @[@{RES_KEY_GROUP_ID: @"1"},
                                                                             @{RES_KEY_GROUP_ID: @"2"}],
                                                    RES_KEY_CONTACT_LIST : @[@{RES_KEY_CONTACT_ID: @"111"},
                                                                               @{RES_KEY_CONTACT_ID: @"222"}],
                                                    RES_KEY_MOBILE_LIST  : @[@{RES_KEY_MOBILE_NO:@"089XXXXXXX"},
                                                                               @{RES_KEY_MOBILE_NO:@"08XXXXXXXX"}]},
                         RES_KEY_SCHEDULE       : @{RES_KEY_START_DATE : @"",
                                                    RES_KEY_END_DATE   : @"",
                                                    RES_KEY_SEND_TIME  : @"23.30"},
                         RES_KEY_RECURRING_LIST : @{RES_KEY_RECURRING_TYPE : @"0",
                                                    RES_KEY_WEEKLY         : @[@{RES_KEY_DAY_OF_WEEK : @"0"},
                                                                               @{RES_KEY_DAY_OF_WEEK : @"1"}],
                                                    RES_KEY_MONTHLY        : @[@{RES_KEY_DAY: @"0"},
                                                                               @{RES_KEY_DAY: @"1"}]}};
        
    }
    
    //##########################################################################
    
    MessageForm *messageForm = [[MessageForm alloc] initWithResponseData:responseData];
    [delegate getScheduleListSuccess:messageForm];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate getScheduleListError:result];
}


@end
