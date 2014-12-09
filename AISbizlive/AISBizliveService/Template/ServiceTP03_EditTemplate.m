//
//  ServiceTP03_EditTemplate.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceTP03_EditTemplate.h"
#import "AISActivity.h"

@implementation ServiceTP03_EditTemplate{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID
                      Name:(NSString *)name
                   Message:(NSString *)message{
    self.ID = ID;
    self.name =name;
    self.message = message;
}
-(void)requestService{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_TP_03_EDIT_TEMPLATE_URL];
    
    NSDictionary *requestDict = @{REQ_KEY_TEMPLATE_ID : self.ID,
                                  REQ_KEY_TEMPLATE_NAME     : self.name,
                                  REQ_KEY_TEMPLATE_MESSAGE : self.message};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate editTemplateError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    TemplateDetail *templateDetail = [[TemplateDetail alloc] initWithResponseData:responseData];
    [delegate editTemplateSuccess:templateDetail];
//    [delegate editTemplateSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [activity dismissActivity];
    [delegate editTemplateError:resultStatus];
}
@end
