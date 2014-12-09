//
//  AISView.m
//  AISbizlive
//
//  Created by Wachirawit on 4/24/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISpList.h"
@implementation AISpList
+(void)setContactListArray:(NSArray *)contactArray{
    contactListArray = contactArray;
}
+(NSArray *)getContactListArray{
    return contactListArray;
}

+(void)setGroupListArray:(NSArray *)groupArray{
    groupListArray = groupArray;
}
+(NSArray *)getGroupListArray{
    return groupListArray;
}

+(void)setTemplateListArray:(NSArray *)templateArray{
    templateListArray = templateArray;
}
+(NSArray *)getTemplateListArray{
    return templateListArray;
}

+(void)setSheduleListArray:(NSArray *)scheduleArray{
    scheduleListArray = scheduleArray;
}
+(NSArray *)getSheduleListArray{
    return scheduleListArray;
}
@end
