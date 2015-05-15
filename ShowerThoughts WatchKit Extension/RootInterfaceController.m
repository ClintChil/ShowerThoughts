//
//  InterfaceController.m
//  ShowerThoughts WatchKit Extension
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RootInterfaceController.h"


@interface RootInterfaceController()

@end


@implementation RootInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self setTitle:@"ShowerThoughts"];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)onDictateButtonPressed {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        if (results && results.count > 0) {
            NSLog(@"%@", results);
        } else {
            NSLog(@"no input from user");
        }
    }];
}

@end



