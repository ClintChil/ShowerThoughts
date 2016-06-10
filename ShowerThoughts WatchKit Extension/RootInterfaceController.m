#import "RootInterfaceController.h"
#import "MainRowType.h"
#import "Post.h"

@interface RootInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableview;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *moreButton;

@property NSUserDefaults *sharedDefaults;


@property (nonatomic)NSArray *posts;

@end


@implementation RootInterfaceController

-(void)setPosts:(NSArray *)posts {
    _posts = posts;
    [self configureTableWithData];
}

-(void)awakeWithContext:(nullable id)context {
    [super awakeWithContext:context];
    [self setTitle:@"Thoughts"];
    [self.moreButton setHidden:YES];
//    [RedditCall pullPostsFromRedditInBackground:^(NSArray *posts, NSError *error) {
//        if (error) {
//            self.posts = @[[Post postForError:error]];
//            NSLog(@"error: %@", error.localizedDescription);
//        }
//        else {
//            self.posts = posts;
//            [self.moreButton setHidden:NO];
//        }
//    }];
//    self.posts = @[[Post defaultPost]];
}


- (IBAction)onNewThoughtButtonPressed {
    [self presentTextInputControllerWithSuggestions:@[] allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results && results.count > 0) {
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
        [theRow.postVoteLabel setText:[NSString stringWithFormat:@"%@", post.votes] ? :@""];
        [theRow.upArrowImage setHidden:post.votes ? NO : YES];
    }
}

- (IBAction)onMoreButtonPressed {
    
}

-(void)table:(nonnull WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
}

-(nullable id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier inTable:(nonnull WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    return self.posts[rowIndex];
}


@end



