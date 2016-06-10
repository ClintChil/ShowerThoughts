//
//  ViewController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "FeedViewController.h"
#import "RedditCall.h"
#import "FeedTableViewCell.h"
#import "STAAlert.h"
#import "DetailPostViewController.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property NSArray *posts;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // enable self-sizing cells - iOS 8 only
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedRowHeight = 66.0;

//    [RedditCall pullPostsFromRedditInBackground:^(NSArray *posts, NSError *error) {
//        self.posts = posts;
//        [self.tableview reloadData];
//        if (error) {
//            [STAAlert presentOneButtonAlertWithTitle:@"There seems to be a network error"
//                                             message:@"You must not have any network connection."
//                                                onVC:self];
//        }
//    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Post *p = [self.posts objectAtIndex:indexPath.row];
    cell.bodyLabel.text = p.body;
    cell.scoreLabel.text = [p.votes stringValue];
    [cell updateConstraintsIfNeeded];
    [cell layoutIfNeeded];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DetailPostViewController class]]) {
        DetailPostViewController *dVC = segue.destinationViewController;
        dVC.post = self.posts[[self.tableview indexPathForSelectedRow].row];
    }
}

@end
