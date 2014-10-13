//
//  ServicePK02_GetTopupList.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "TopupDetail.h"
@protocol GetTopupDelegate <NSObject>

- (void)getTopupSuccess:(TopupDetail *)topupDetail;
- (void)getTopupError:(ResultStatus *)resultStatus;

@end

@interface ServicePK02_GetTopupList : BizliveService

@property (nonatomic, assign)id<GetTopupDelegate> delegate;

@property (nonatomic, strong)NSString *ID,*name;
@end
