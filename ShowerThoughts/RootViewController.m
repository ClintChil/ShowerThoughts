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
    RKLink *currentLink = [self.posts objectAtIndex:indexPath.row];
    cell.textLabel.text = currentLink.title;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

@end
