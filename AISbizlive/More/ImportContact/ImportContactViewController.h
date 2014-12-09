//
//  ImportContactViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "ServiceCT12_ImportContact.h"

//@class ImportContactViewController;
//@protocol ImportContactViewControllerDelegate <NSObject>
//- (void)didFinishImportContact:(NSMutableArray *)importsArray;
//@end
@interface ImportContactViewController : UITableViewController<ImportContactDelegate>
{
    
    IBOutlet UITableView *mytable;
}
//@property (nonatomic, weak) id <ImportContactViewControllerDelegate> delegate;
@end
