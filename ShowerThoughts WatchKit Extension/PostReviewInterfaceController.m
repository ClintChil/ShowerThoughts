//
//  PostReviewInterfaceController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "PostReviewInterfaceController.h"

@interface PostReviewInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;

@end

@implementation PostReviewInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
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
            NSLog(@"%@", results);
            [self presentControllerWithName:@"PostReview" context:results];
        } else {
            NSLog(@"no input from user");
        }
        
    }];

}
- (IBAction)onPostButtonPressed {
    
}

@end



