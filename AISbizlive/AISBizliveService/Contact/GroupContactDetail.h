//
//  GroupContactDetail.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveServiceParameter.h"
#import "ResponseGetContactList.h"

@interface GroupContactDetail : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSString *ID, *name, *imageURL, *lastUpdate;
@property (nonatomic, strong)NSArray *contactList;



@end
