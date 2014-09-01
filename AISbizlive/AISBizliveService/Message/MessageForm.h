//
//  MessageForm.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum RecurringType : NSInteger{
    NONE,
    DAILY,
    WEEKLY,
    MONTHLY
}RecurringType;

typedef enum  SendMessageType : NSInteger{
    SEND_TYPE_IMMEDIATELY,
    SEND_TYPE_SCHEDULE,
    SEND_TYPE_RECURRING
} SendMessageType;


@interface MessageForm : NSObject
{
    SendMessageType _sendMessageType;
}
- (id)initWithResponseData:(NSDictionary *)responseData;
- (void)setSendMessageType:(SendMessageType)sendMessageType;
- (NSDictionary *)getForm;

//Message Object
@property (nonatomic, strong)NSString *messageID;
@property (nonatomic, strong)NSString *message;
@property (nonatomic, strong)NSString *timeExpire;
@property (nonatomic, strong)NSString *sendType;

//Receiver Object
@property (nonatomic, strong)NSArray *contactIDList;
@property (nonatomic, strong)NSArray *groupIDList;
@property (nonatomic, strong)NSArray *mobileNOList;

//Schedule Object
@property (nonatomic, strong)NSString *startDate;
@property (nonatomic, strong)NSString *endDate;
@property (nonatomic, strong)NSString *sendTime;

//Recurring Object
@property (nonatomic, strong)NSString *recurringType;
@property (nonatomic, strong)NSArray *weeklyList;
@property (nonatomic, strong)NSArray *monthlyList;



@end
