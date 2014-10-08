//
//  ServiceCT10_EditGroupContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "GroupContactDetail.h"

@protocol EditGroupContactDelegate <NSObject>

- (void)editGroupContactSuccess:(GroupContactDetail *)groupContactDetail;
- (void)editGroupContactError:(ResultStatus *)status;

@end

@interface ServiceCT10_EditGroupContact : BizliveService

- (void)setParameterWithGroupID:(NSString *)groupID
                           name:(NSString *)name
                        image64:(NSString *)image64
                      contactID:(NSArray *)contactID;
    

@property (nonatomic, assign)id<EditGroupContactDelegate> delegate;
@property (nonatomic, strong)NSString *groupID, *name, *image64;
@property (nonatomic, strong)NSArray *contactID;
@end
