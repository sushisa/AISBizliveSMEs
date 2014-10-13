//
//  TemplateList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TemplateDetail.h"
#import "BizliveServiceParameter.h"
@implementation TemplateDetail
@synthesize ID, name, message;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.ID = responseData[RES_KEY_TEMPLATE_ID];
        self.name = responseData[RES_KEY_TEMPLATE_NAME];
        self.message = responseData[RES_KEY_TEMPLATE_MESSAGE];
    }
    return self;
}

@end
