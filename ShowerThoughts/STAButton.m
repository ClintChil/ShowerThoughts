#import "STAButton.h"
#import "UIColor+SRTColor.h"

@implementation STAButton

-(void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

-(void)setup {
    self.layer.borderColor = [[UIColor staBlueColor] CGColor];
    [self setTintColor:[UIColor staBlueColor]];
    self.layer.borderWidth = 3.0;
    self.layer.cornerRadius = 5.0;
}

@end
