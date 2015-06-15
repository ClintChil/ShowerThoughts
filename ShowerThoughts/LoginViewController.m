//
//  LoginViewController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/21/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>
#import <RedditKit/RedditKit.h>
#import "SharedDefaults.h"
#import "STAAlert.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property NSUserDefaults *sharedDefaults;

@end

@implementation LoginViewController

- (void)viewDidAppear:(BOOL)animated {
    if (![SharedDefaults hasSignedIn]) {
        [STAAlert presentOneButtonAlertWithTitle:@"Hi lets get you setup."
                                         message:@"In order to allow you to post your ShowerThoughts, we need to sign you into Reddit. You should only ever have to do this once."
                                            onVC:self];
    }
}



- (IBAction)onSignInButtonPressed:(UIButton *)sender {
    [[RKClient sharedClient] signInWithUsername:self.usernameField.text
                                       password:self.passwordField.text
                                     completion:^(NSError *error) {
                                         if (!error) {

                                             [SharedDefaults setUsernameDefault:self.usernameField.text
                                                             andPasswordDefault:self.passwordField.text];
                                             [SharedDefaults markAsSignedIn];
                                             [self.view endEditing:YES];
                                             [self performSegueWithIdentifier:@"ToRoot" sender:self];
                                         }
                                         else {
                                             [STAAlert presentOneButtonAlertWithTitle:@"There was a problem with your Reddit login."
                                                                              message:@"Make sure you are using the correct username and password."
                                                                                 onVC:self];
                                         }
                                     }];

}

@end
