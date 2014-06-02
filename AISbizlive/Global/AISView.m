//
//  AISView.m
//  AISbizlive
//
//  Created by Wachirawit on 4/24/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISView.h"
#import "AISColor.h"
@implementation AISView

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
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
        self.layer.borderWidth = 1.0f;
    }
    return self;
}
+(UIView *)changeLayerError : (UIView *)errorView{
//    UIView *errorView = [[UIView alloc] init];
    [errorView.layer setBorderColor:[[UIColor redColor] CGColor]];
    return errorView;
}
+(UIView *)changeLayerNomal : (UIView *)nomalView{
//    UIView *nomalView = [[UIView alloc] init];
    [nomalView.layer setBorderColor:[[AISColor lightgrayColor] CGColor]];
    return nomalView;
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
