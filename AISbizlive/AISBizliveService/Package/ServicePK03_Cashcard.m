//
//  ServicePK03_Cashcard.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServicePK03_Cashcard.h"
#import "AISActivity.h"

@implementation ServicePK03_Cashcard{
    AISActivity *activity;
}
@synthesize delegate;
- (void)setParameterWithSerialCode:(NSString *)SerialCode{
    self.serialCode =SerialCode;
}
-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_PK_03_CASHCARD_URL];
    NSDictionary *requestDict = @{REQ_KEY_CASHCARD_SERIALCODE : self.serialCode};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate cashCardError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    CashcardDetail *serviceData = [[CashcardDetail alloc] initWithResponseData:responseData];
    [delegate cashCardSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate cashCardError:resultStatus];
    [activity dismissActivity];
}
@end
