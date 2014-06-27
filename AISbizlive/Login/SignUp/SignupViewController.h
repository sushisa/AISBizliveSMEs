//
//  SignupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface SignupViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>{
    //Views
    
    __weak IBOutlet UIView *fullView;
    __weak IBOutlet UIView *emailView;
    __weak IBOutlet UIView *phoneView;
    __weak IBOutlet UIView *passwordView;
    __weak IBOutlet UIView *confirmView;
    
    __weak IBOutlet UIButton *photoImage;
    __weak IBOutlet UIImageView *imageVieq;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UITextField *phoneField;
    __weak IBOutlet UILabel *phoneLabel;
    __weak IBOutlet UITextField *fullNameField;
    __weak IBOutlet UITextField *passField;
    __weak IBOutlet UILabel *passLabel;
    __weak IBOutlet UITextField *confirmPassField;
    __weak IBOutlet UILabel *confirmPassLabel;
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIButton *policyButton;
    __weak IBOutlet UIButton *termButton;
    __weak IBOutlet UILabel *termandpolicyLabel;
    __weak IBOutlet UIButton *doneButton;
}

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;

@property (strong, nonatomic) NSString *facebookID;
- (IBAction)choosePicture:(id)sender;

- (IBAction)confirmSignUp:(id)sender;
@end
