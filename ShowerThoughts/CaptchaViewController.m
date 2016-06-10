#import "CaptchaViewController.h"

@interface CaptchaViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property UIImage *image;

@end

@implementation CaptchaViewController

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

+(instancetype)fromNibWithImage:(UIImage *)image {
    CaptchaViewController *cVC = [[CaptchaViewController alloc]initWithNibName:@"CaptchaViewController" bundle:nil];
    cVC.image = image;
    return cVC;
}

-(void)viewWillAppear:(BOOL)animated {
    self.imageView.image = self.image;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)submitCaptchaOnTap:(UIButton *)sender {
    [self.delegate captchaVC:self didEnterCaptchaValue:self.textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
