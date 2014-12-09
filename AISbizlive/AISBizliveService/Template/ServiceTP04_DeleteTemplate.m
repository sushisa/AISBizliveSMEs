//
//  ServiceTP04_DeleteTemplate.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceTP04_DeleteTemplate.h"
#import "AISActivity.h"

@implementation ServiceTP04_DeleteTemplate{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID{
    self.ID = ID;
}
-(void)requestService{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_TP_04_DELETE_TEMPLATE_URL];
    NSArray *templateID = [NSArray arrayWithObject:self.ID];
    NSDictionary *requestDict = @{REQ_KEY_TEMPLATE_LIST : templateID};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate deleteTemplateError:resultStatus];
        return;
    }
    [delegate deleteTemplateSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [activity dismissActivity];
    [delegate deleteTemplateError:resultStatus];
}
@end
