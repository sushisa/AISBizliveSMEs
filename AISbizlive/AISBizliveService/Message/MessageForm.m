//
//  MessageForm.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "MessageForm.h"

#import "BizliveServiceParameter.h"


@implementation MessageForm

- (id)init
{
    self = [super init];
    if (self) {
        //Message Object
        self.messageID = @"";
        self.message = @"";
        self.timeExpire = @"";
        self.sendType = @"";
        
        //Receiver Object
        self.contactIDList = [NSArray array];
        self.groupIDList = [NSArray array];
        self.mobileNOList = [NSArray array];
        
        //Schedule Object
        self.startDate = @"";
        self.endDate = @"";
        self.sendTime = @"";
        
        //Recurring Object
        self.recurringType = @"";
        self.weeklyList = [NSArray array];
        self.monthlyList = [NSArray array];
    }
    return self;
}

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        //Message Object
        self.messageID = responseData[RES_KEY_MESSAGE_ID];
        self.message = responseData[RES_KEY_MESSAGE];
        self.timeExpire = responseData[RES_KEY_TIME_EXPIRE];
        self.sendType = responseData[RES_KEY_SEND_TYPE];
        
        //Receiver Object
        NSDictionary *receiverList = responseData[RES_KEY_RECEIVER_LIST];
        
            //ContactList
            NSArray *contactList = receiverList[RES_KEY_CONTACT_LIST];
            NSMutableArray *contactIDArray = [NSMutableArray array];
            for (NSDictionary *contact in contactList) {
                NSString *contactID = contact[RES_KEY_CONTACT_ID];
                [contactIDArray addObject:contactID];
            }
            self.contactIDList = contactIDArray;
        
            //GroupList
            NSArray *groupList = receiverList[RES_KEY_GROUP_LIST];
            NSMutableArray *groupIDArray = [NSMutableArray array];
            for (NSDictionary *group in groupList) {
                NSString *groupID = group[RES_KEY_GROUP_ID];
                [groupIDArray addObject:groupID];
            }
            self.groupIDList = groupIDArray;
        
            //MobileList
            NSArray *mobileList = receiverList[RES_KEY_MOBILE_LIST];
            NSMutableArray *mobileNOArray = [NSMutableArray array];
            for (NSDictionary *mobile in mobileList) {
                NSString *mobileNO = mobile[RES_KEY_CONTACT_MOBILE_NO];
                [mobileNOArray addObject:mobileNO];
            }
            self.mobileNOList = mobileNOArray;
        
        //Schedule Object
        NSDictionary *schedule = responseData[RES_KEY_SCHEDULE];
        self.startDate = schedule[RES_KEY_START_DATE];
        self.endDate = schedule[RES_KEY_END_DATE];
        self.sendTime = schedule[RES_KEY_SEND_TIME];
        
        //Recurring Object
        NSDictionary *recurringList = responseData[RES_KEY_RECURRING_LIST];
        self.recurringType = recurringList[RES_KEY_RECURRING_TYPE];
        
            //WeeklyList
            NSArray *weeklyList = recurringList[RES_KEY_WEEKLY];
            NSMutableArray *weeklyArray = [NSMutableArray array];
            for (NSDictionary *weekly in weeklyList) {
                NSString *dayOfWeek = weekly[RES_KEY_DAY_OF_WEEK];
                [weeklyArray addObject:dayOfWeek];
            }
            self.weeklyList = weeklyArray;
            
            //MonthlyList
            NSArray *monthlyList = recurringList[RES_KEY_MONTHLY];
            NSMutableArray *monthlyArray = [NSMutableArray array];
            for (NSDictionary *monthly in monthlyList) {
                NSString *dayOfMonth = monthly[RES_KEY_DAY];
                [monthlyArray addObject:dayOfMonth];
            }
            self.monthlyList = monthlyArray;
    }
    return self;

}

- (void)setSendMessageType:(SendMessageType)sendMessageType;
{
    _sendMessageType = sendMessageType;
}

- (NSDictionary *)getForm
{
    
    //Prepare Message Form
    
    NSDictionary *prepareMessage = @{RES_KEY_MESSAGE_ID    : self.messageID,
                                  RES_KEY_MESSAGE       : self.message,
                                  RES_KEY_TIME_EXPIRE   : self.timeExpire,
                                  RES_KEY_SEND_TYPE     : self.sendType};
    
    NSMutableDictionary *requestData = [NSMutableDictionary dictionaryWithDictionary:prepareMessage];
    
    NSMutableArray *weeklyListArray;
    NSMutableArray *dayArray;
    
    switch (_sendMessageType) {
        case SEND_TYPE_IMMEDIATELY:
            //Prepare Receiver Form
            requestData[RES_KEY_RECEIVER_LIST] = @{RES_KEY_CONTACT_LIST : self.contactIDList,
                                                   RES_KEY_GROUP_LIST   : self.groupIDList,
                                                   RES_KEY_MOBILE_LIST    : self.mobileNOList};
            break;
        case SEND_TYPE_SCHEDULE:
            //Prepare Schedule Form
            requestData[RES_KEY_SCHEDULE] = @{RES_KEY_START_DATE: self.startDate,
                                              RES_KEY_END_DATE  : self.endDate,
                                              RES_KEY_SEND_TIME : self.sendTime};
            break;
        case SEND_TYPE_RECURRING:
            //Prepare Recurring Form
            weeklyListArray = [NSMutableArray new];
            dayArray = [NSMutableArray new];
            for (NSString *weekly in self.weeklyList) {
                [weeklyListArray addObject:@{RES_KEY_DAY_OF_WEEK : weekly}];
            }
            
            for (NSString *day in self.monthlyList) {
                [dayArray addObject:@{RES_KEY_DAY: day}];
            }
            
            
            requestData[RES_KEY_RECURRING_LIST] = @{RES_KEY_RECURRING_TYPE  : self.recurringType,
                                                    RES_KEY_WEEKLY          : weeklyListArray,
                                                    RES_KEY_MONTHLY         : dayArray};
            break;
        default:
            break;
    }
    
    
    return requestData;
     
}
@end
