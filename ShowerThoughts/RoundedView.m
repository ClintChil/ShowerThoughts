#import "RoundedView.h"

@implementation RoundedView

-(void)prepareForInterfaceBuilder {
    [self setup];
}

-(void)awakeFromNib {
    [self setup];
}

-(void)setup {
    self.layer.cornerRadius = 5.0;
    self.clipsToBounds = YES;
}

@end
