#import "PostReviewController.h"
#import "Post.h"
#import "Constants.h"


@interface PostReviewController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;
@property (weak, nonatomic) Post *post;
@end


@implementation PostReviewController


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

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
                NSLog(@"error: %@", error.localizedDescription);
            }
            [self dismissController];
        }];
    }else {
        [self dismissController];
    }
}

@end
