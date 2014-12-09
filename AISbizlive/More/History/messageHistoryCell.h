//
//  messageHistoryCell.h
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface messageHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *success;
@property (weak, nonatomic) IBOutlet UILabel *failed;

@end
