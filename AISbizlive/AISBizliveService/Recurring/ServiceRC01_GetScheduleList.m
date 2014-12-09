//
//  ServiceRC01_GetScheduleList.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC01_GetScheduleList.h"
//#import "AISActivity.h"
@implementation ServiceRC01_GetScheduleList{
//    AISActivity *activity;
}
@synthesize delegate;

- (void)requestService
{
//    activity = [[AISActivity alloc] init];
//    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_RC_01_GET_SCHEDULE_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
    
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
//    [activity dismissActivity];
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
        
        responseDict = @{RES_KEY_MESSAGE_ID     : @"",
                         RES_KEY_MESSAGE        : @"",
                         RES_KEY_TIME_EXPIRE    : @"",
                         RES_KEY_SEND_TYPE      : @"",
                         RES_KEY_RECEIVER_LIST  : @{RES_KEY_GROUP_LIST : @[@{RES_KEY_GROUP_ID: @"1"},
                                                                             @{RES_KEY_GROUP_ID: @"2"}],
                                                    RES_KEY_CONTACT_LIST : @[@{RES_KEY_CONTACT_ID: @"111"},
                                                                               @{RES_KEY_CONTACT_ID: @"222"}],
                                                    RES_KEY_MOBILE_LIST  : @[@{RES_KEY_CONTACT_MOBILE_NO:@"089XXXXXXX"},
                                                                            @{RES_KEY_CONTACT_MOBILE_NO:@"08XXXXXXXX"}]},
                         RES_KEY_SCHEDULE       : @{RES_KEY_START_DATE : @"",
                                                    RES_KEY_END_DATE   : @"",
                                                    RES_KEY_SEND_TIME  : @"23.30"},
                         RES_KEY_RECURRING_LIST : @{RES_KEY_RECURRING_TYPE : @"0",
                                                    RES_KEY_WEEKLY         : @[@{RES_KEY_DAY_OF_WEEK : @"0"},
                                                                               @{RES_KEY_DAY_OF_WEEK : @"1"}],
                                                    RES_KEY_MONTHLY        : @[@{RES_KEY_DAY: @"0"},
                                                                               @{RES_KEY_DAY: @"1"}]}};
        
    }
//    ResponseBizLiveData :
//    {
//        responseData =     {
//            scheduleList =         (
//                                    {
//                                        isEditExpired = Y;
//                                        message = "\U0e44\U0e17\U0e22 eng";
//                                        receiverResponseList =                 {
//                                            contactList =                     (
//                                                                               {
//                                                                                   contactId = 1519;
//                                                                                   contactName = name;
//                                                                               },
//                                                                               {
//                                                                                   contactId = 1588;
//                                                                                   contactName = Vasin;
//                                                                               }
//                                                                               );
//                                        };
//                                        recurringList =                 {
//                                            recurringType = 1;
//                                        };
//                                        schedule =                 {
//                                            endDate = 1419094800000;
//                                            startDate = 1414602000000;
//                                            timeSend = "23.04";
//                                        };
//                                        scheduleId = 1062;
//                                        scheduleInstanceId = "20141030_230400";
//                                        sendType = 2;
//                                        timeExpire = 1;
//                                    },
//                                    {
//                                        isEditExpired = Y;
//                                        message = "test message recuring  everday";
//                                        receiverResponseList =                 {
//                                            contactList =                     (
//                                                                               {
//                                                                                   contactId = 1588;
//                                                                                   contactName = Vasin;
//                                                                               },
//                                                                               {
//                                                                                   
//                                                                                   contactId = 1519;
//                                                                                   contactName = name;
//                                                                               }
//                                                                               );
//                                        };
//                                        recurringList =                 {
//                                            recurringType = 1;
//                                        };
//                                        schedule =                 {
//                                            endDate = 1419094800000;
//                                            startDate = 1414602000000;
//                                            timeSend = "23.04";
//                                        };
//                                        scheduleId = 1063;
//                                        scheduleInstanceId = "20141030_230400";
//                                        sendType = 2;
//                                        timeExpire = 1;
//                                    }
//                                    );
//        };
//        responseStatus =     {
//            responseCode = 0000;
//            responseMessage = "\U0e40\U0e23\U0e35\U0e22\U0e01\U0e01\U0e32\U0e23\U0e15\U0e31\U0e49\U0e07\U0e04\U0e48\U0e32\U0e01\U0e32\U0e23\U0e2a\U0e48\U0e07\U0e02\U0e49\U0e2d\U0e04\U0e27\U0e32\U0e21\U0e17\U0e31\U0e49\U0e07\U0e2b\U0e21\U0e14\U0e2a\U0e33\U0e40\U0e23\U0e47\U0e08";
//        };
//    }

    
    //##########################################################################
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getScheduleListError:resultStatus];
        return;
    }
    
    NSDictionary * reponseData = responseDict[RES_KEY_RESPONSE_DATA];
    NSArray *messageList = reponseData[RES_KEY_SCHEDULE_LIST];
    NSMutableArray *scheduleList = [[NSMutableArray alloc] init];
    for (NSDictionary *message in messageList) {
        RecurringForm *messageForm = [[RecurringForm alloc] initWithResponseData:message];
        [scheduleList addObject:messageForm];
    }
    [delegate getScheduleListSuccess:scheduleList];
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
//    [activity dismissActivity];
    [delegate getScheduleListError:resultStatus];
}


@end
