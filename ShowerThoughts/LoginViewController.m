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

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property NSUserDefaults *sharedDefaults;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.showerModel"];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    if (![[RKClient sharedClient] isSignedIn]) {
        NSLog(@"taint logged in");
    }
}

- (IBAction)onSignInButtonPressed:(UIButton *)sender {
    [[RKClient sharedClient] signInWithUsername:self.usernameField.text password:self.passwordField.text completion:^(NSError *error) {
        if (!error) {
            [self.sharedDefaults setObject:self.usernameField.text forKey:@"username"];
            [self.sharedDefaults setObject:self.passwordField.text forKey:@"password"];
            [self.sharedDefaults synchronize];
            
            NSLog(@"Successfully signed in!");
            [self performSegueWithIdentifier:@"ToRoot" sender:self];
        }
    }];
}

@end
