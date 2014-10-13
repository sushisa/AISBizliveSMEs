//
//  ServiceTP04_DeleteTemplate.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceTP04_DeleteTemplate.h"

@implementation ServiceTP04_DeleteTemplate
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID{
    self.ID = ID;
}
-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_TP_04_DELETE_TEMPLATE_URL];
    
    NSDictionary *requestDict = @{RES_KEY_TEMPLATE_ID : self.ID};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate deleteTemplateError:resultStatus];
        return;
    }
    [delegate deleteTemplateSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate deleteTemplateError:nil];
}
@end
