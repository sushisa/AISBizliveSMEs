//
//  AISView.h
//  AISbizlive
//
//  Created by Wachirawit on 4/24/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSArray  *contactListArray;
static NSArray  *groupListArray;
static NSArray  *templateListArray;
static NSArray  *scheduleListArray;
@interface AISpList : NSObject

+(void)setContactListArray:(NSArray *)contactArray;
+(NSArray *)getContactListArray;

+(void)setGroupListArray:(NSArray *)groupArray;
+(NSArray *)getGroupListArray;

+(void)setTemplateListArray:(NSArray *)templateArray;
+(NSArray *)getTemplateListArray;

+(void)setSheduleListArray:(NSArray *)scheduleArray;
+(NSArray *)getSheduleListArray;
@end

