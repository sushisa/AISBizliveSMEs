//
//  AISAlertView.h
//  AISbizlive
//
//  Created by Wachirawit on 5/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISAlertView : NSObject

-(id)withActionLeft:(SEL)leftactionbutton withActionRight:(SEL)rightactionbutton  withTarget:(id)target message:(NSString *)message LeftString : (NSString *)LeftString RightString: (NSString *)RightString;
-(void)dismissAlertView;
-(void)showAlertView;
@end
