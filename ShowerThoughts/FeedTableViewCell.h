//
//  FeedTableViewCell.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
