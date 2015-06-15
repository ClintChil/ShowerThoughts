//
//  STAAlert.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAAlert : NSObject

+(void)presentOneButtonAlertWithTitle:(NSString *)title message:(NSString *)message onVC:(UIViewController *)vc;

@end
