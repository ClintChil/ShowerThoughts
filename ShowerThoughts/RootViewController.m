//
//  ViewController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RootViewController.h"
#import <RedditKit/RedditKit.h>

@interface RootViewController ()

@property NSArray *subreddits;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[RKClient sharedClient] subscribedSubredditsWithCompletion:^(NSArray *subreddits, RKPagination *pagination, NSError *error) {
        self.subreddits = subreddits;
        NSLog(@"Subreddits: %@", subreddits);
        
        RKSubreddit *subreddit = [[self subreddits] firstObject];
        NSLog(@"%@", subreddit);
        if (subreddit) {
            [[RKClient sharedClient] linksInSubreddit:subreddit pagination:nil completion:^(NSArray *links, RKPagination *pagination, NSError *error) {
                NSLog(@"Links: %@", links);
            }];
        }
    }];
    
//    [[RKClient sharedClient] submitSelfPostWithTitle:@"toost" subredditName:@"test" text:nil captchaIdentifier:nil captchaValue:nil completion:^(NSError *error) {
//        if (error) {
//            NSLog([NSString stringWithFormat:@"there was an error: %@", error]);
//        }
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
