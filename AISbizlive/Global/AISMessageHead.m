//
//  AISMessageHead.m
//  AISbizlive
//
//  Created by Wachirawit on 6/23/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISMessageHead.h"
#import "AISColor.h"
@implementation AISMessageHead

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    
    if(self){
        self.layer.cornerRadius = 7.0f;
//        self.layer.masksToBounds = YES;
        self.backgroundColor = [AISColor lightgrayColor];
//        self.layer.borderWidth = 1.0f;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
