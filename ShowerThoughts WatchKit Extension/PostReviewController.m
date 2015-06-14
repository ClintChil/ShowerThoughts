#import "PostReviewController.h"
#import "Post.h"


@interface PostReviewController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;
@property (weak, nonatomic) Post *post;
@end


@implementation PostReviewController


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSLog(@"%@", context);
    self.postBodyLabel.text = (NSString *)context;
    self.post = [Post postWithBody:(NSString *)context];
}

- (IBAction)onRetakeButtonPressed {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results.count) {
            NSLog(@"Dictation input: %@", results);
            self.postBodyLabel.text = results[0];
        } else {
            NSLog(@"no input from user");
        }
    }];
}

- (IBAction)onPostButtonPressed {
    if (self.post) {
        [self.post pushPostToRedditInBackground:^(NSError *error) {
            if (error) {
                NSLog(@"Post Error: %@", error.localizedDescription);
            }
            [self dismissController];
        }];
    }
}

@end
