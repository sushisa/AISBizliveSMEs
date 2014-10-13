//
//  ResponseGetTemplateList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseGetTemplateList.h"
#import "BizliveServiceParameter.h"

@implementation ResponseGetTemplateList


- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.templateList = [[NSMutableArray alloc] init];
        NSArray *arrTemplateList = responseData[RES_KEY_TEMPLATE_LIST];
        
        for (NSInteger i = 0; i < [arrTemplateList count]; i++) {
            TemplateDetail *templates = [[TemplateDetail alloc] initWithResponseData:arrTemplateList[i]];
            [self.templateList addObject:templates];
        }
        
    }
    return self;
}
@end
