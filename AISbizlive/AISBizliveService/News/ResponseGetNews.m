//
//  ResponseGetNews.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseGetNews.h"
#import "BizliveServiceParameter.h"

@implementation ResponseGetNews

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.newsList = [[NSMutableArray alloc] init];
        NSArray *arrNewsList = responseData[RES_KEY_NEWS_LIST];
        
        for (NSInteger i = 0; i < [arrNewsList count]; i++) {
            NewsDetail *list = [[NewsDetail alloc]initWithResponseData:arrNewsList[i]];
            [self.newsList addObject:list];
        }
    }
    return self;
}

@end
