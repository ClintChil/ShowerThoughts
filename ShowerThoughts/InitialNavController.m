#import "InitialNavController.h"
#import "SharedDefaults.h"
#import "LoginViewController.h"
#import "UIColor+SRTColor.h"

@interface InitialNavController ()

@end

@implementation InitialNavController

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
//    if (![SharedDefaults hasSignedIn]) {
//        [self presentViewController:[LoginViewController storyboardInstance] animated:YES completion:nil];
//    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
//    if ([SharedDefaults hasSignedIn]) {
//        [RedditCall signInBackgroundWithUserName:[SharedDefaults usernameDefault] andPassword:[SharedDefaults passwordDefault] block:^(NSError *error) {
//            if (error) {
//                NSLog(@"Couldn't sign them up");
//            }
//        }];
//    }
}

@end
