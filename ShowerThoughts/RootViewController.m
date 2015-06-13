//
//  ViewController.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RootViewController.h"
#import <RedditKit/RedditKit.h>

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property NSArray *posts;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"iPhone RootViewController viewDidLoad");
    // enable self-sizing cells - iOS 8 only
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedRowHeight = 44.0;
    
    [[RKClient sharedClient] subredditWithName:@"showerthoughts" completion:^(id object, NSError *error) {
        RKSubreddit *selectedSubReddit = object;
        [[RKClient sharedClient] linksInSubreddit:selectedSubReddit pagination:nil completion:^(NSArray *collection, RKPagination *pagination, NSError *error) {
            self.posts = collection;
            [self.tableview reloadData];
        }];
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.numberOfLines = 0;
    RKLink *currentLink = [self.posts objectAtIndex:indexPath.row];
    cell.textLabel.text = currentLink.title;
    cell.detailTextLabel.text = currentLink.author;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (IBAction)onPoopLogButtonPressed:(UIButton *)sender {
    NSLog(@"iPhone PoopLogButtonPressed");
}

@end
