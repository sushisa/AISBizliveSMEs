//
//  NewsDetail.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDetail : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSString *ID,*title,*detail,*smallPhoto,*nomalPhoto,*date;

@end
