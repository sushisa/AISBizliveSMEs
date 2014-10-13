//
//  ServiceTP03_EditTemplate.h
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "TemplateDetail.h"
@protocol EditTemplateDelegate <NSObject>

- (void)editTemplateSuccess:(TemplateDetail *)templateDetail;
- (void)editTemplateError:(ResultStatus *)resultStatus;

@end

@interface ServiceTP03_EditTemplate : BizliveService


- (void)setParameterWithID:(NSString *)ID
                        Name:(NSString *)name
                     Message:(NSString *)message;
@property (nonatomic, assign)id<EditTemplateDelegate> delegate;

@property (nonatomic, strong)NSString *ID,*name,*message;

@end
