//
//  NewPostViewController.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "NewPostViewController.h"
#import "Post.h"
#import "STAAlert.h"

@interface NewPostViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *postButton;

@end

@implementation NewPostViewController

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postButton.enabled = NO;
    [self.textView becomeFirstResponder];
}

- (IBAction)postOnTap:(id)sender {
    Post *post = [Post postWithBody:self.textView.text];
    [post pushPostToRedditInBackgroundWithCaptchaId:nil captchaVal:nil block:^(UIImage *image, NSError *error) {
        if (image) {
            //TODO: Show a view to allow the user to input the captcha.
        } else if (error){
            [STAAlert presentOneButtonAlertWithTitle:@"Sorry we had an issue with your post"
                                             message:@"Make sure you have logged in."
                                                onVC:self];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (IBAction)cancelOnTap:(id)sender {
    [self.textView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.postButton.enabled = YES;
    }
}
@end
