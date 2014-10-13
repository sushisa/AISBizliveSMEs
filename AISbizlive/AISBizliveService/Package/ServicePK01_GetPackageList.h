//
//  ServicePK01_GetPackageList.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "PackageDetail.h"
@protocol GetPackageDelegate <NSObject>

- (void)getPackageSuccess:(PackageDetail *)packageDetail;
- (void)getPackageError:(ResultStatus *)resultStatus;

@end

@interface ServicePK01_GetPackageList : BizliveService

@property (nonatomic, assign)id<GetPackageDelegate> delegate;
@end
