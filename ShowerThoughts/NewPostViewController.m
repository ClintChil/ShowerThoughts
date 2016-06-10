#import "NewPostViewController.h"
#import "Post.h"
#import "STAAlert.h"
#import "CaptchaViewController.h"
#import "Captcha.h"

@interface NewPostViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
@property Post *post;

@end

@implementation NewPostViewController
{
    CaptchaViewController *capVC;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postButton.enabled = NO;
    [self.textView becomeFirstResponder];
}

#pragma mark - Actions
- (IBAction)postOnTap:(id)sender {
    self.post = [Post postWithBody:self.textView.text];
    [self.post checkIfNeedCAPTCHAInBackground:^(BOOL result, UIImage *image, NSError *error) {
        if (result) {
            capVC = [CaptchaViewController fromNibWithImage:image];
            capVC.delegate = self;
            [self animateInView:capVC.view];
        }else {
            [self.post postOnRedditWithBlock:^(BOOL result, NSError *error) {
                if (error) {
                    [STAAlert presentOneButtonAlertWithTitle:@"Sorry we had an issue with your post"
                                                     message:@"Make sure you have logged in."
                                                        onVC:self];

                } else {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
        }
    }];
}

-(void)animateInView:(UIView *)view {
    [self.view endEditing:YES];
    view.center = CGPointMake(CGRectGetMidX(self.view.frame),
                              CGRectGetMaxY(self.view.frame) + CGRectGetHeight(view.frame));
    [self.view addSubview:view];
    [UIView animateWithDuration:0.5 animations:^{
        view.center = CGPointMake(view.center.x, CGRectGetMidY(self.view.frame) - CGRectGetHeight(view.frame)/2);
    }];
}

- (IBAction)cancelOnTap:(id)sender {
    [self.textView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TextViewDelegate
-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.postButton.enabled = YES;
    }
}


@end














