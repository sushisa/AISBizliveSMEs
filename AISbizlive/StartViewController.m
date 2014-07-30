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
#import "SignupViewController.h"
@interface StartViewController ()
{
    NSUserDefaults *defaults;
    NSDictionary *facebookData;
}
@end

@implementation StartViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    defaults = [NSUserDefaults standardUserDefaults];
    facebookData = [[NSDictionary alloc] init];
    if ([[defaults objectForKey:@"lang"] isEqualToString:@"EN"]) {
        [BtnchangeLanguage setOn:YES];
    }
    else{
        [BtnchangeLanguage setOn:NO];
    }
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
//    [self updateView];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
//    [FBSession.activeSession closeAndClearTokenInformation];
//    [FBSession.activeSession close];
//    [FBSession setActiveSession:nil];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithBehavior:FBSessionLoginBehaviorWithNoFallbackToWebView completionHandler:^(FBSession *session,
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
        NSLog(@"OPEN");
    } else {
        NSLog(@"Not Open");
    }
}
-(void)setTextLangage{
    btnSignIn.layer.cornerRadius = 5.0f;
    btnSignIn.layer.borderWidth = 1.0f;
    btnSignIn.titleLabel.font = [FontUtil fontWithFontSize:eFontSizeNormal];
    btnSignIn.layer.borderColor = [AISColor lightgreenColor].CGColor;
    [btnSignIn setTitle:[AISString commonString:typeButton KeyOfValue:@"SIGNIN"]forState:UIControlStateNormal];
    [btnSignUpEmail setTitle:[AISString commonString:typeButton KeyOfValue:@"SIGNUP_EMAIL"] forState:UIControlStateNormal];
    btnSignUpEmail.titleLabel.font = [FontUtil fontWithFontSize:eFontSizeNormal];
    [btnSignUpFacebook setTitle:[AISString commonString:typeButton KeyOfValue:@"SIGNUP_FACE"] forState:UIControlStateNormal];
   btnSignUpFacebook.titleLabel.font = [FontUtil fontWithFontSize:eFontSizeNormal];
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
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithBehavior:FBSessionLoginBehaviorWithNoFallbackToWebView completionHandler:^(FBSession *session,
                                                                                                                    FBSessionState status,
                                                                                                                    NSError *error) {
                // we recurse here, in order to update buttons and labels
                [self updateView];
            }];
        }
    }
//    [self performSegueWithIdentifier:@"CheckFBLogin" sender:self];
    [defaults setValue:@"Facebook" forKey:@"type"];
    [defaults synchronize];
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"CheckFBLogin"]) {
//        SignupViewController *detailPeople =[[SignupViewController alloc] initWithNibName:nil bundle:nil];
//
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailPeople];
//        //now present this navigation controller as modally
//        [self presentViewController:navigationController animated:YES completion:nil];
//    }
//}
- (IBAction)SignupEmail:(id)sender {
    [defaults setValue:@"Email" forKey:@"type"];
    [defaults synchronize];
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    
    [[AISAlertView alloc] dismissAlertView];
}
@end
