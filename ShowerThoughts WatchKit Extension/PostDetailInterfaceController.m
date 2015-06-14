//
//  PostDetailInterfaceController.m
//  ShowerThoughts
//
//  Created by Mert Akanay on 6/13/15.
//  Copyright © 2015 Clint Chilcott. All rights reserved.
//

#import "PostDetailInterfaceController.h"
#import "Post.h"

@interface PostDetailInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *postLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *timeLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *userLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *postScore;
@property (nonatomic)Post *selPost;
@end

@implementation PostDetailInterfaceController

-(void)setSelPost:(Post *)selPost {
    [self.postLabel setText:selPost.body];
    [self.userLabel setText:selPost.author];
    [self.postScore setText:[selPost.votes stringValue]];
    NSDateFormatter *dForm = [NSDateFormatter new];
    dForm.dateFormat = @"MMM dd, yyyy";
    NSString *s = [dForm stringFromDate:selPost.created];
    [self.timeLabel setText:s];
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.selPost = (Post *)context;
}

@end



