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
#import "CaptchaViewController.h"
#import "Captcha.h"

@interface NewPostViewController ()<UITextViewDelegate, PostDelegate>
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

#pragma mark - Actions
- (IBAction)postOnTap:(id)sender {
    Post *post = [Post postWithBody:self.textView.text];
    post.delegate = self;
    [post postOnRedditInBackground:^(BOOL result, NSError *error) {
        if (error) {
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

#pragma mark - TextViewDelegate
-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.postButton.enabled = YES;
    }
}

#pragma mark - PostDelegate
-(Captcha *)needCaptchaFromImage:(UIImage *)image forPost:(Post *)post {
    return nil;
}
@end
