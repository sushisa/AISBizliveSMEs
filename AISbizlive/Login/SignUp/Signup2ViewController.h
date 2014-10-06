//
//  Signup2ViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 9/3/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Signup2ViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView *myTableView;
    __weak IBOutlet UIView *personView;
    __weak IBOutlet UIImageView *imagePerson;
    __weak IBOutlet UILabel *personLabel;
    __weak IBOutlet UIView *juristicView;
    __weak IBOutlet UIImageView *imageJuristic;
    __weak IBOutlet UILabel *juristicLabel;
    
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextField *lastNameTextField;
    
    __weak IBOutlet UIButton *photoImage;
    __weak IBOutlet UIImageView *imageVieq;
    
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UITextField *phoneField;
    __weak IBOutlet UILabel *phoneLabel;
    __weak IBOutlet UITextField *passField;
    __weak IBOutlet UILabel *passLabel;
    __weak IBOutlet UITextField *confirmPassField;
    __weak IBOutlet UILabel *confirmPassLabel;
    __weak IBOutlet UIButton *policyButton;
    __weak IBOutlet UIButton *termButton;
    __weak IBOutlet UILabel *termandpolicyLabel;
    __weak IBOutlet UIButton *doneButton;
    __weak IBOutlet UILabel *idCardLabel;
    __weak IBOutlet UITextField *idCardField;
    __weak IBOutlet UILabel *companyLabel;
    __weak IBOutlet UITextField *companyField;
    __weak IBOutlet UILabel *taxIdLabel;
    __weak IBOutlet UITextField *taxIdField;
}
- (IBAction)termClick:(id)sender;

- (IBAction)policyClick:(id)sender;

- (IBAction)choosePicture:(id)sender;

- (IBAction)confirmSignUp:(id)sender;
@end
