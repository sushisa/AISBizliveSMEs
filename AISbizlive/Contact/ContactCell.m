//
//  ContactCell.m
//  AISbizlive
//
//  Created by Wachirawit on 4/23/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ContactCell.h"
#import "AISGlobal.h"
@implementation ContactCell
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
    if(self){
        offset=34.0;
        self.checkContact = [[UIImageView alloc] init];
        
        [self.checkContact setFrame:CGRectMake(-(offset),  (self.contentView.frame.size.height/2.0)-(25/2.0), 25  , 25)];
        
        [self.checkContact setImage:[UIImage imageNamed:@"Ok_Grey.png"]];

        [self.checkContact setAlpha:0.0f];
//        [self.checkContact setAdjustsImageWhenHighlighted:NO];
        [self addSubview:self.checkContact];
    }
    return self;
}
-(void) layoutSubviews{
    [super layoutSubviews];
    
    if(self.isEditing){
        self.checkContact.frame=CGRectMake((offset/2.0)-(25.0/3.0),  (self.contentView.frame.size.height/2.0)-(25/2.0), 25  , 25);
        [self.checkContact setAlpha:1.0f];
        [self.discriptionImage setAlpha:0.0f];
        
    }else{
        self.checkContact.frame=CGRectMake(-(offset),  (self.contentView.frame.size.height/2.0)-(25/2.0), 25  , 25);
        [self.checkContact setAlpha:0.0f];
        [self.discriptionImage setAlpha:1.0f];
    }
}
-(void) buttonSelected:(UIButton*) sender{
    [sender setSelected:sender.isSelected];
}

- (void)awakeFromNib
{
    // Initialization code
    
    self.imageContact.layer.cornerRadius = 10.0f;
    self.imageContact.layer.borderWidth = 1.0f;
    self.imageContact.layer.borderColor = [AISColor lightgrayColor].CGColor;
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
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.size.height -= 2*2;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}
@end
