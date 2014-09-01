//
//  ImportCell.m
//  AISbizlive
//
//  Created by Wachirawit on 6/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ImportCell.h"
#import "AISGlobal.h"

@implementation ImportCell
{
    UIButton *btn;
    CGFloat offset;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
    self.layer.borderWidth = 1.0f;
    self.editButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width, 0, 40, self.contentView.frame.size.height)];
    self.editButton.backgroundColor = [AISColor grayColor];
    self.editButton.titleLabel.text = @"Edit";
    
    self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width+40, 0, 40, self.contentView.frame.size.height)];
    self.deleteButton.backgroundColor = [UIColor redColor];
    self.deleteButton.titleLabel.text = @"Delete";
    return self;
}
- (void)awakeFromNib
{
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(selected){
        self.layer.borderColor = [[AISColor lightgreenColor] CGColor];
        
        self.layer.borderWidth = 1.5f;
    }
    else{
        self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
        self.layer.borderWidth = 1.0f;
    }
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
//-(void)setImageContact:(UIImageView *)imageContact{
////    imageContact.layer.cornerRadius = 10.0f;
//}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.origin.y += 5;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
