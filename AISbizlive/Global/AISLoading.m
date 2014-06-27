//
//  AISLoading.m
//  AISbizlive
//
//  Created by Wachirawit on 6/6/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISLoading.h"
#import "AppDelegate.h"

UIView *backGroundView;
UIActivityIndicatorView *spinner;

@implementation AISLoading
+(void)loadingStart{
    UIWindow* mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    
    // Create a full-screen subview
    backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    backGroundView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.3f];
    
    //    [spinnerView addSubview:datePicker];
    spinner  = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.hidesWhenStopped = YES;
    [spinner setColor:[UIColor whiteColor]];
    [spinner setCenter:CGPointMake(mainWindow.center.x, mainWindow.center.y)];
    [spinner startAnimating];
    [backGroundView addSubview:spinner];
    // Add the subview to the main window
    [mainWindow addSubview:backGroundView];

}
+(void)loadingStop{
    [backGroundView removeFromSuperview];
}
@end
