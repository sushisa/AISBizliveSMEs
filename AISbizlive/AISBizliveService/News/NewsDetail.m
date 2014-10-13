//
//  NewsDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "NewsDetail.h"
#import "BizliveServiceParameter.h"

@implementation NewsDetail
@synthesize ID,title,detail,smallPhoto,nomalPhoto,date;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.ID = responseData[RES_KEY_NEWS_ID];
        self.title = responseData[RES_KEY_NEWS_TITLE];
        self.detail = responseData[RES_KEY_NEWS_DETAIL];
        self.smallPhoto = responseData[RES_KEY_NEWS_PHOTOSMALLPATH];
        self.nomalPhoto = responseData[RES_KEY_NEWS_PHOTONORMALPATH];
        self.date = responseData[RES_KEY_NEWS_DATE];
        
    }
    return self;
}
@end
