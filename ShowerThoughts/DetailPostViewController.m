//
//  DetailPostViewController.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "DetailPostViewController.h"
#import "Post.h"

@interface DetailPostViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel
;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation DetailPostViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.bodyLabel.text = self.post.body;
    self.authorLabel.text = self.post.author;
    self.scoreLabel.text = [self.post.votes stringValue];
}
- (IBAction)upVotePostOnTap:(id)sender {
}

- (IBAction)downVotePostOnTap:(id)sender {
}
@end
