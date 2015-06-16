//
//  STAAlert.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAAlert : NSObject

/**
 Description: This displays a one button alert with the Button just displaying one button saying "DISMISS".
 @param: title: The Title of the Alert
 @param: message: The message of the Alert
 @param: vc: The UIViewController to display the Alert on.
 */
+(void)presentOneButtonAlertWithTitle:(NSString *)title message:(NSString *)message onVC:(UIViewController *)vc;

@end
