//
//  DetailPeopleGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 9/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailPeopleGroupViewController;
@protocol DetailPeopleGroupViewControllerDelegate <NSObject>
- (void)didFinishSelectedContact:(NSMutableArray *)contactList;
@end

@interface DetailPeopleGroupViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    IBOutlet UITextField *searchTextField;
    IBOutlet UITableView *mytable;
}
@property (nonatomic, weak) id <DetailPeopleGroupViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *IDContactGroup;
@property (strong, nonatomic) NSMutableArray *ArrayContactGroup;
@property (strong, nonatomic) NSString *idGroup;
@property (strong, nonatomic) NSString *GroupName;
@end
