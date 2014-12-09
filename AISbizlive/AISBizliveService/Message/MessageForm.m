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
            self.mobileNOList = mobileList;
        
        //Schedule Object
        NSDictionary *schedule = responseData[RES_KEY_SCHEDULE];
        self.startDate = schedule[RES_KEY_START_DATE];
        self.endDate = schedule[RES_KEY_END_DATE];
        self.sendTime = schedule[RES_KEY_SEND_TIME];
        
        //Recurring Object
        NSDictionary *recurringList = responseData[RES_KEY_RECURRING_RESPONSE_LIST];
        
        //WeeklyList
        NSArray *weeklyList = recurringList[RES_KEY_WEEKLY];
        self.weeklyList = weeklyList;
            
        //MonthlyList
        NSArray *monthlyList = recurringList[RES_KEY_MONTHLY];
        self.monthlyList = monthlyList;
    }
    return self;

}

- (void)setSendMessageType:(SendMessageType)sendMessageType;
{
    _sendMessageType = sendMessageType;
}
- (void)setRecurringType:(RecurringType)recurringType
{
    _recurringType = recurringType;
}

- (NSDictionary *)getForm
{
    
    //Prepare Message Form
    
    NSDictionary *prepareMessage = @{
                                  RES_KEY_MESSAGE       : self.message,
                                  RES_KEY_TIME_EXPIRE   : self.timeExpire,
                                  RES_KEY_MESSAGE_TYPE     : [NSString stringWithFormat:@"%d",_sendMessageType]};
    
    NSMutableDictionary *requestData = [NSMutableDictionary dictionaryWithDictionary:prepareMessage];
    
    NSMutableDictionary *newdict = [[NSMutableDictionary alloc] init];
    if ([self.contactIDList count] > 0 ) {
        [newdict setObject:self.contactIDList forKey:RES_KEY_CONTACT_LIST];
    }
    if ([self.groupIDList count] > 0) {
        [newdict setObject:self.groupIDList forKey:RES_KEY_CONTACT_GROUP_LIST];
    }
    if ([self.mobileNOList count] > 0) {
        [newdict setObject:self.mobileNOList forKey:RES_KEY_MOBILE_LIST];
    }
    [requestData setObject:newdict forKey:RES_KEY_RECEIVER_LIST];
    
    NSMutableDictionary *dayDict = [[NSMutableDictionary alloc] init];
    switch (_sendMessageType) {
        case SEND_TYPE_SCHEDULE:
            //Prepare Schedule Form
            requestData[RES_KEY_SCHEDULE] = @{RES_KEY_START_DATE: self.startDate,
                                              RES_KEY_END_DATE  : self.endDate,
                                              RES_KEY_SEND_TIME : self.sendTime};
            break;
        case SEND_TYPE_RECURRING:
            //Prepare Recurring Form
            
            requestData[RES_KEY_SCHEDULE] = @{RES_KEY_START_DATE: self.startDate,
                                              RES_KEY_END_DATE  : self.endDate,
                                              RES_KEY_SEND_TIME : self.sendTime};
                if ([self.weeklyList count] > 0) {
                    [dayDict setObject:self.weeklyList forKey:RES_KEY_WEEKLY];
                }
                if( [self.monthlyList count] > 0){
                    [dayDict setObject:self.monthlyList forKey:RES_KEY_MONTHLY];
                }
                [dayDict setObject:[NSString stringWithFormat:@"%d",_recurringType] forKey:RES_KEY_RECURRING_TYPE];
            
                [requestData setObject:dayDict forKey:RES_KEY_RECURRING_LIST];
            break;
        default:
            break;
    }
    
    
    return requestData;
     
}
@end
