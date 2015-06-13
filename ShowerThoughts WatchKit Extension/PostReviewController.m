//
//  PostReviewInterfaceController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "PostReviewController.h"
//#import <RedditKit/RedditKit.h>


@interface PostReviewController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;
@property (weak, nonatomic) NSString *postTime;

@end

@implementation PostReviewController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSLog(@"%@", context);
    self.postBodyLabel.text = context;
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)onRetakeButtonPressed {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results && results.count > 0) {
            NSLog(@"Dictation input: %@", results);
            self.postBodyLabel.text = results[0];
            self.postTime = results[0];
            
            
        } else {
            NSLog(@"no input from user");
        }
        
    }];

}
- (IBAction)onPostButtonPressed {
    
    NSLog(@"onPostButtonPressed fired!");
    
    [WKInterfaceController openParentApplication:@{@"action": @"count"} reply:^(NSDictionary *replyInfo, NSError *error) {
        NSLog(@"Post request fired");
        NSLog([NSString stringWithFormat:@"Post request returned: %@", replyInfo[@"action"]]);
    }];
}

@end



