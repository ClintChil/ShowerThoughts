//
//  InterfaceController.m
//  ShowerThoughts WatchKit Extension
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RootInterfaceController.h"
#import "MainRowType.h"
#import "Post.h"
#import <RedditKit/RedditKit.h>

@interface RootInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableview;
@property NSUserDefaults *sharedDefaults;


@property NSArray *posts;

@end


@implementation RootInterfaceController
- (IBAction)onTestButtonPressed {
    NSLog(@"Watch TestButtonPressed");
    
    
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    
    self.posts = @[@"Vampires are pretty well-groomed considering they did it all without a mirror.",
                   @"We're all Internet Explorers.",
                   @"If Jehovah's Witnesses believe there are only 144,000 spots in heaven, why do they go around telling everyone about it instead of keeping it a secret?",
                   @"If my body were actually a temple, and I were its custodian, I probably would have been fired years ago",
                   @"To go to sleep, you have to pretend to be asleep until you actually are.",
                   @"A college diploma is just a receipt",
                   @"They should legalize all drugs, but only make them available by ordering through Comcast customer support"];
    
//    [self.mainFeed setNumberOfRows:self.posts.count withRowType:@"mainFeed"];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.showerModel"];
    NSString *username = [self.sharedDefaults stringForKey:@"username"];
    NSString *password = [self.sharedDefaults stringForKey:@"password"];
    
    [[RKClient sharedClient] signInWithUsername:username password:password completion:^(NSError *error) {
        if (!error) {
            NSLog(@"Successfully signed in!");
            
        }
    }];

    
    [self setTitle:@"Thoughts"];
    
    
    [self configureTableWithData:self.posts];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)onNewThoughtButtonPressed {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results && results.count > 0) {
            NSLog(@"%@", results);
            [self presentControllerWithName:@"PostReview" context:results[0]];
        } else {
            NSLog(@"no input from user");
        }
        
    }];
}

- (void)configureTableWithData:(NSArray *)dataObjects {
    [self.tableview setNumberOfRows:[dataObjects count] withRowType:@"mainFeed"];
    for (NSInteger i = 0; i < self.tableview.numberOfRows; i++) {
        MainRowType *theRow = [self.tableview rowControllerAtIndex:i];
        NSString *postString = [self.posts objectAtIndex:i];
        
        [theRow.postBodyLabel setText:postString];
        
        
    }
    
}
- (IBAction)onMoreButtonPressed {
    
}

- (IBAction)onDraftsButtonPressed {
    
}


@end



