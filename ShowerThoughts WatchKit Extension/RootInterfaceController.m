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
#import "RedditCall.h"
//#import <RedditKit/RedditKit.h>

@interface RootInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableview;
@property NSUserDefaults *sharedDefaults;


@property (nonatomic)NSArray *posts;

@end


@implementation RootInterfaceController

-(void)setPosts:(NSArray *)posts {
    _posts = posts;
    [self configureTableWithData];
}
- (IBAction)onTestButtonPressed {
    NSLog(@"Watch TestButtonPressed");
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
//    self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.showerModel"];
//    NSString *username = [self.sharedDefaults stringForKey:@"username"];
//    NSString *password = [self.sharedDefaults stringForKey:@"password"];

    [self setTitle:@"Thoughts"];

    [self configureTableWithData];
    [RedditCall makeCallToRedditInBackground:^(NSArray *posts, NSError *error) {
        if (error) {
            self.posts = @[[Post postForError:error]];
            NSLog(@"error: %@", error.localizedDescription);
        }
        self.posts = posts;
    }];
    self.posts = @[[Post defaultPost]];

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

- (void)configureTableWithData {
    [self.tableview setNumberOfRows:[self.posts count] withRowType:@"mainFeed"];
    for (NSInteger i = 0; i < self.tableview.numberOfRows; i++) {
        MainRowType *theRow = [self.tableview rowControllerAtIndex:i];
        Post *post = [self.posts objectAtIndex:i];
        
        [theRow.postBodyLabel setText:post.body];
        [theRow.postVoteLabel setText:[NSString stringWithFormat:@"⬆︎%@⬇︎", post.votes]];
    }
    
}

- (IBAction)onMoreButtonPressed {
    
}

- (IBAction)onDraftsButtonPressed {
    
}

-(void)table:(nonnull WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
}

-(nullable id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier inTable:(nonnull WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    return self.posts[rowIndex];
}


@end



