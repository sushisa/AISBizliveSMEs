//
//  ServiceTP01_AddTemplate.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceTP01_AddTemplate.h"
#import "AISActivity.h"

@implementation ServiceTP01_AddTemplate{
    AISActivity *activity;
}
@synthesize delegate;
- (void)setParameterWithName:(NSString *)name
                     Message:(NSString *)message{
    self.name = name;
    self.message = message;
}
-(void)requestService{
    activity = [[AISActivity alloc] init];
//    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_TP_01_ADD_TEMPLATE_URL];
    
    NSDictionary *requestDict = @{REQ_KEY_TEMPLATE_NAME     : self.name,
                                  REQ_KEY_TEMPLATE_MESSAGE : self.message};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    if (![Admin isOnline]) {
        responseDict = @{RES_KEY_TEMPLATE_ID: @"1xx3234",
                         RES_KEY_TEMPLATE_NAME: @"Pluem",
                         RES_KEY_TEMPLATE_MESSAGE: @"MessageTemplate",};
    }
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate addTemplateError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    TemplateDetail *templateDetail = [[TemplateDetail alloc] initWithResponseData:responseData];
    [delegate addTemplateSuccess:templateDetail];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [activity dismissActivity];
    [delegate addTemplateError:resultStatus];
}

@end
