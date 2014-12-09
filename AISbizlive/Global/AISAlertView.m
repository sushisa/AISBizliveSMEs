//
//  AISAlertView.m
//  AISbizlive
//
//  Created by Wachirawit on 5/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISAlertView.h"
#import "AppDelegate.h"
#import "AISColor.h"
@implementation AISAlertView

UIView *newView;
UIView* backGroundView;
-(id)withActionLeft:(SEL)leftactionbutton withActionRight:(SEL)rightactionbutton  withTarget:(id)target message:(NSString *)message LeftString : (NSString *)LeftString RightString: (NSString *)RightString{
//    CGFloat positionY = ([[UIScreen mainScreen] bounds].size.height-200 ) /2 ;
    UIWindow* mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    
    // Create a full-screen subview
    backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    CGFloat width = 240;
    CGFloat height = 0;
    CGRect r = [message boundingRectWithSize:CGSizeMake(width, height)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                                        context:nil];
    UILabel *MessageLabel = [[UILabel alloc] init];
    if (r.size.height <= 100) {
        newView = [[UIView alloc] initWithFrame:CGRectMake(0 , 0 , 280 , 180)];
        [MessageLabel setFrame:CGRectMake(20, 40, width, r.size.height)];
    }
    else {
        newView = [[UIView alloc] initWithFrame:CGRectMake(0 , 0 , 280 , 100 +r.size.height)];
        
        [MessageLabel setFrame:CGRectMake(20, 20, width, r.size.height)];
    }
    [MessageLabel setNumberOfLines:0];
    [MessageLabel setFont:[UIFont systemFontOfSize:17.0f]];
    [MessageLabel setTextColor:[UIColor whiteColor]];
    [MessageLabel setText:message];
    [MessageLabel setTextAlignment:NSTextAlignmentCenter];
    [newView setCenter:CGPointMake(mainWindow.center.x, mainWindow.center.y)];
    newView.layer.borderWidth = 1.0f;
    newView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    newView.layer.cornerRadius = 7.0f;
    newView.backgroundColor = [AISColor lightgreenColor];
    [newView addSubview:MessageLabel];
    
    if ([RightString isEqualToString:@""] || RightString == nil) {
        UIButton *centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, newView.frame.size.height-55, newView.frame.size.width-20, 40)];
        [centerBtn setTitle:LeftString forState:UIControlStateNormal];
        [centerBtn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
        [centerBtn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateHighlighted];
        centerBtn.layer.borderWidth = 1.0f;
        centerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        centerBtn.layer.cornerRadius = 7.0f;
        [centerBtn setBackgroundColor:[UIColor whiteColor]];
//        [centerBtn setTag:10];
        
        [centerBtn addTarget:target action:leftactionbutton forControlEvents:UIControlEventTouchUpInside];
        [newView addSubview:centerBtn];
    }
    else if (RightString != nil && LeftString != nil){
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, newView.frame.size.height-55, newView.frame.size.width/2-20, 40)];
        [leftBtn setTitle:LeftString forState:UIControlStateNormal];
        [leftBtn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
        [leftBtn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateHighlighted];
        leftBtn.layer.borderWidth = 1.0f;
        leftBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        leftBtn.layer.cornerRadius = 7.0f;
        leftBtn.backgroundColor = [UIColor whiteColor];
        [leftBtn addTarget:target action:leftactionbutton forControlEvents:UIControlEventTouchUpInside];
        //        [OKbtn setTag:10];
        [newView addSubview:leftBtn];
        //
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(newView.frame.size.width/2+10, newView.frame.size.height-55, newView.frame.size.width/2-20, 40)];
        [rightBtn setTitle:RightString forState:UIControlStateNormal];
        [rightBtn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
        [rightBtn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateHighlighted];
        rightBtn.layer.borderWidth = 1.0f;
        rightBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        rightBtn.layer.cornerRadius = 7.0f;
        rightBtn.backgroundColor = [UIColor whiteColor];
        [rightBtn addTarget:target action:rightactionbutton forControlEvents:UIControlEventTouchUpInside];
        //        [Cancelbtn setTag:10];
        [newView addSubview:rightBtn];
    }
    // Set up some properties of the subview
    backGroundView.backgroundColor = [UIColor clearColor];
    
//    [spinnerView addSubview:datePicker];
    [backGroundView addSubview:newView];
    // Add the subview to the main window
    [mainWindow addSubview:backGroundView];
    return self;
}
-(void)showAlertView{
    newView.transform = CGAffineTransformMakeScale( 0.001, 0.001);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
    newView.transform = CGAffineTransformMakeScale( 1.1, 1.1);
    
    [UIView commitAnimations];
}
- (void)bounce1AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/2];
    [UIView setAnimationDelegate:self];
    newView.transform = CGAffineTransformMakeScale (0.9, 0.9);
    [UIView commitAnimations];
}
-(void)dismissAlertView{
    
    [backGroundView removeFromSuperview];
    [newView removeFromSuperview];
}
@end
