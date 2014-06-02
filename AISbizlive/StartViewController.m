//
//  ViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "StartViewController.h"
#import "AppDelegate.h"
#import "AISGlobal.h"
@interface StartViewController ()

@end

@implementation StartViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _pageImages = @[@"Avatar_Default.png", @"Avatar_Edit.png", @"More_B.png", @"Packgage_B.png", @"TellFriends_B.png"];
   
//    NSLog(@"%@",);
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-250);
    
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController navigationController];
    [self.pageViewController didMoveToParentViewController:self];
    
    //pageIndicator
    UIPageControl *pageControl = [UIPageControl appearance];
    
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self setTextLangage];
    [self updateView];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session,
                                                                                                           FBSessionState status,
                                                                                                           NSError *error) {
                // we recurse here, in order to update buttons and labels
                [self updateView];
            }];
        }
    }
    
}
- (void)updateView {
    // get the app delegate, so that we can reference the session property
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (appDelegate.session.isOpen) {
        // valid account UI is shown whenever the session is open
        
        NSLog(@"Login %@",appDelegate.session.accessTokenData.accessToken);
//        [self.buttonLoginLogout setTitle:@"Log out" forState:UIControlStateNormal];
//        [self.textNoteOrLink setText:[NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@",
//                                      appDelegate.session.accessTokenData.accessToken]];
    } else {
        NSLog(@"Not Open");
        // login-needed account UI is shown whenever the session is closed
//        [self.buttonLoginLogout setTitle:@"Log in" forState:UIControlStateNormal];
//        [self.textNoteOrLink setText:@"Login to create a link to fetch account data"];
    }
}
-(void)setTextLangage{
    btnSignIn.layer.cornerRadius = 5.0f;
    btnSignIn.layer.borderWidth = 1.0f;
    btnSignIn.layer.borderColor = [AISColor lightgreenColor].CGColor;
    [btnSignIn setTitle:[AISBLString defaultString:BUTTON_SIGNIN] forState:UIControlStateNormal];
    [btnSignUpEmail setTitle:[AISBLString defaultString:BUTTON_SIGNUP] forState:UIControlStateNormal];
    [btnSignUpFacebook setTitle:[AISBLString defaultString:BUTTON_FACEBOOK_SIGNUP] forState:UIControlStateNormal];
}
-(void)checkSessionFB{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    appDelegate.session = [[FBSession alloc] init];
    if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
//        [appDelegate.session openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session,
//                                                         FBSessionState status,
//                                                         NSError *error) {
//        }];
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             
         }];
    }
    else{
//        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info"]
//                                           allowLoginUI:YES
//                                      completionHandler:
//         ^(FBSession *session, FBSessionState state, NSError *error) {
//             
//         }];
        [self performSegueWithIdentifier:@"CheckFBLogin" sender:self];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setHidden:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageImages count] == 0) || (index >= [self.pageImages count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)ChangeLanguage:(id)sender {
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if ([sender isOn]) {
        NSLog(@"ON");
        [defaults setValue:@"EN" forKey:@"lang"];
        [defaults synchronize];
        [self setTextLangage];
    }
    else{
        NSLog(@"OFF");
        [defaults setValue:@"TH" forKey:@"lang"];
        [defaults synchronize];
        [self setTextLangage];
    }
}

- (IBAction)FacebookLogin:(id)sender {
//    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:@"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" LeftString:@"Cancel" RightString:@"OK"];
//    [ss showAlertView];
//    [AISAlertView withAction:@selector(dissm:) withTarget:self LeftString:@"OK" RightString:@"Cancel"];
//    [[[AISAlertView alloc] init] performSelector:@selector(dismissAlertView)];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    // this button's job is to flip-flop the session from open to closed
    if (appDelegate.session.isOpen) {
        // if a user logs out explicitly, we delete any cached token information, and next
        // time they run the applicaiton they will be presented with log in UX again; most
        // users will simply close the app or switch away, without logging out; this will
        // cause the implicit cached-token login to occur on next launch of the application
        [appDelegate.session closeAndClearTokenInformation];
        
    } else {
        if (appDelegate.session.state != FBSessionStateCreated) {
            // Create a new, logged out session.
            appDelegate.session = [[FBSession alloc] init];
        }
        
        // if the session isn't open, let's open it now and present the login UX to the user
        [appDelegate.session openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session,
                                                                                                       FBSessionState status,
                                                                                                       NSError *error) {
            // we recurse here, in order to update buttons and labels
            [self updateView];
        }];
    }
    
}
-(void)leftAction:(id)sender{
    
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    
    [[AISAlertView alloc] dismissAlertView];
}
@end
