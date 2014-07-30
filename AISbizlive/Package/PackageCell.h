//
//  PackageCell.h
//  AISbizlive
//
//  Created by Wachirawit on 7/8/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *packageName;
@property (weak, nonatomic) IBOutlet UILabel *sumSMS;
@property (weak, nonatomic) IBOutlet UILabel *amountPackage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionAmount;
@property (weak, nonatomic) IBOutlet UILabel *descriptionSMS;
@end
