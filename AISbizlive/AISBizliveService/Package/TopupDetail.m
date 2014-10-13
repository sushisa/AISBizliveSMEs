//
//  TopupDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TopupDetail.h"
#import "BizliveServiceParameter.h"
@implementation TopupDetail

@synthesize ID, name;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.ID = responseData[RES_KEY_TOPUP_ID];
        self.name = responseData[RES_KEY_TOPUP_NAME];
    }
    return self;
}

- (id)initWithTopupDetail:(NSArray*)TopupDetail
{
    self = [super init];
    if (self) {
        self.ID = TopupDetail[0];
        self.name = TopupDetail[1];
    }
    return self;
}

@end
