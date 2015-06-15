//
//  STAAlert.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "STAAlert.h"

@implementation STAAlert

+(void)presentOneButtonAlertWithTitle:(NSString *)title message:(NSString *)message onVC:(UIViewController *)vc {
    UIAlertController *a = [UIAlertController alertControllerWithTitle:title
                                                               message:message
                                                        preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"DISMISS"
                                          style:UIAlertActionStyleCancel
                                        handler:nil]];
    [vc presentViewController:a animated:YES completion:nil];
}

@end
