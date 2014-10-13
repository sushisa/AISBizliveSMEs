//
//  ServiceTP02_GetTemplateList.h
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "ResponseGetTemplateList.h"
@protocol GetTemplateListDelegate <NSObject>

- (void)getTemplateListSuccess:(ResponseGetTemplateList *)responseGetTemplateList;
- (void)getTemplateListError:(ResultStatus *)resultStatus;

@end

@interface ServiceTP02_GetTemplateList : BizliveService


@property (nonatomic, assign)id<GetTemplateListDelegate> delegate;

@end
