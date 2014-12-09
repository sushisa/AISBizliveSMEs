//
//  PackageViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServicePK01_GetPackageList.h"
@interface PackageViewController : UITableViewController<GetPackageDelegate>
{
    IBOutlet UITableView *mytable;
}
- (IBAction)goToDetailPackage:(id)sender;
@end
