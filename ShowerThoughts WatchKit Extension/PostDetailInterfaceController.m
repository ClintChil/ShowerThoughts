//
//  PostDetailInterfaceController.m
//  ShowerThoughts
//
//  Created by Mert Akanay on 6/13/15.
//  Copyright © 2015 Clint Chilcott. All rights reserved.
//

#import "PostDetailInterfaceController.h"

@interface PostDetailInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *postLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *timeLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *userLabel;

@end

@implementation PostDetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



