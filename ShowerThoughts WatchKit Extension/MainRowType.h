//
//  MainRowType.h
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface MainRowType : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postVoteLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *upArrowImage;

@end
