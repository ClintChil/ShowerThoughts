//
//  LoginViewController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/21/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "LoginViewController.h"
#import "SharedDefaults.h"
#import "STAAlert.h"
#import "RedditCall.h"


@interface LoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property NSUserDefaults *sharedDefaults;

@end

@implementation LoginViewController

+(instancetype)storyboardInstance {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [SharedDefaults setNeedsCaptcha:YES];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillChangeFrameNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSDictionary *dict = [note userInfo];
        NSValue *keyboardFrame = dict[UIKeyboardFrameEndUserInfoKey];
        CGRect frame = [keyboardFrame CGRectValue];
        NSNumber *duration = dict[UIKeyboardAnimationDurationUserInfoKey];
        double durationDouble = [duration doubleValue];
        [UIView animateWithDuration:durationDouble animations:^{
            self.view.frame = CGRectMake(0, frame.origin.y - self.view.frame.size.height,
                                         self.view.frame.size.width, self.view.frame.size.height);
        }];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    if (![SharedDefaults hasSignedIn]) {
        [STAAlert presentOneButtonAlertWithTitle:@"Hi lets get you setup."
                                         message:@"In order to allow you to post your ShowerThoughts, we need to sign you into Reddit. You should only ever have to do this once."
                                            onVC:self];
    }
}



- (IBAction)onSignInButtonPressed:(UIButton *)sender {
    [self.view endEditing:YES];
    [RedditCall signInBackgroundWithUserName:self.usernameField.text
                                 andPassword:self.passwordField.text
                                       block:^(NSError *error) {
                                           if (!error) {
                                               [SharedDefaults setUsernameDefault:self.usernameField.text
                                                               andPasswordDefault:self.passwordField.text];
                                               [SharedDefaults markAsSignedIn];
                                               [self.view endEditing:YES];
                                               [self dismissViewControllerAnimated:YES completion:nil];
                                           }else {
                                               [STAAlert presentOneButtonAlertWithTitle:@"There was a problem with your Reddit login."
                                                                                message:@"Make sure you are using the correct username and password."
                                                                                   onVC:self];

                                           }

    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
