#import "PostReviewController.h"


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

- (IBAction)onRetakeButtonPressed {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results.count) {
            NSLog(@"Dictation input: %@", results);
            self.postBodyLabel.text = results[0];
            self.postTime = results[0];
        } else {
            NSLog(@"no input from user");
        }
    }];
}

- (IBAction)onPostButtonPressed {
    
    [WKInterfaceController openParentApplication:@{@"action": @"count"} reply:^(NSDictionary *replyInfo, NSError *error) {
        NSLog(@"Post request fired");
        NSLog(@"Post request returned: %@", replyInfo ?: @"FUCK ALL");
    }];
}

@end
