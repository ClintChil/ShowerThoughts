//
//  InitialNavController.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "InitialNavController.h"
#import "SharedDefaults.h"
#import "LoginViewController.h"

@interface InitialNavController ()

@end

@implementation InitialNavController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor blackColor];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    if (![SharedDefaults hasSignedIn]) {
        [self presentViewController:[LoginViewController storyboardInstance] animated:YES completion:nil];
    }
}

@end
