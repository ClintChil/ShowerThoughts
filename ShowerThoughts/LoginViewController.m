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
@property NSUserDefaults *defaults;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.showerModel"];
    NSString *username = [self.defaults objectForKey:@"username"];
    NSString *password = [self.defaults objectForKey:@"password"];

    self.usernameField.text = username;
    self.passwordField.text = password;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    if (![[RKClient sharedClient] isSignedIn]) {
        NSLog(@"taint logged in");
    }
}

- (IBAction)onSignInButtonPressed:(UIButton *)sender {

    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;

    [[RKClient sharedClient] signInWithUsername:self.usernameField.text password:self.passwordField.text completion:^(NSError *error) {
        if (!error) {

            [self.defaults setObject:username forKey:@"username"];
            [self.defaults setObject:password forKey:@"password"];
            [self.defaults synchronize];

            NSLog(@"Successfully signed in!");
            [self performSegueWithIdentifier:@"ToRoot" sender:self];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
