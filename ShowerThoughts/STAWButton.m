#import "STAWButton.h"

@implementation STAWButton

-(void)awakeFromNib {
    [self setup];
}

-(void)prepareForInterfaceBuilder {
    [self setup];
}

-(void)setup {
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self setTintColor:[UIColor whiteColor]];
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 5.0;
}

@end
