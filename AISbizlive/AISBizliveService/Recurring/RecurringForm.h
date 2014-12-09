//
//  MessageForm.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecurringForm : NSObject
- (id)initWithResponseData:(NSDictionary *)responseData;

- (NSDictionary *)getForm;

//Message Object
@property (nonatomic, strong)NSString *scheduleID;
@property (nonatomic, strong)NSString *scheduleInstanceID;
@property (nonatomic, strong)NSString *message;
@property (nonatomic, strong)NSString *timeExpire;
@property (nonatomic, strong)NSString *sendType;
@property (nonatomic, strong)NSString *isEditExpire;

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
