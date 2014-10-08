//
//  ServiceCT11_DeleteGroupContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT11_DeleteGroupContact.h"



@implementation ServiceCT11_DeleteGroupContact
@synthesize delegate;

- (void)setParameterWithGroupIDList:(NSArray *)groupIDList
{
    self.groupIDList = groupIDList;
}

- (void)requestService
{
    NSMutableArray *groupList = [NSMutableArray new];
    for (NSString *groupID in self.groupIDList) {
        NSDictionary *groupDict = @{REQ_KEY_GROUP_ID: groupID};
        [groupList addObject:groupDict];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_GROUP_LIST: groupList};
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate deleteGroupContactSuccess];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate deleteGroupContactError:result];
}


@end
