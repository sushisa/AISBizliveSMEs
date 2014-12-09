//
//  ServiceNW01_GetNews.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "ResponseGetNews.h"
@protocol GetNewsDelegate <NSObject>

- (void)getNewsSuccess:(ResponseGetNews *)responseGetNews;
- (void)getNewsError:(ResultStatus *)resultStatus;

@end

@interface ServiceNW01_GetNews : BizliveService
@property (nonatomic, assign)id<GetNewsDelegate> delegate;
@end
