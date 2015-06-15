//
//  NewPostViewController.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *postButton;

@end

@implementation NewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postButton.enabled = NO;
    [self.textView becomeFirstResponder];
}

- (IBAction)postOnTap:(id)sender {
}

- (IBAction)cancelOnTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.postButton.enabled = YES;
    }
}
@end
