//
//  ResponseGetTemplateList.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateDetail.h"
@interface ResponseGetTemplateList : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *templateList;

@end
