//
//  CaptchaViewController.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "CaptchaViewController.h"

@interface CaptchaViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CaptchaViewController

+(instancetype)fromNibWithImage:(UIImage *)image {
    CaptchaViewController *cVC = [[CaptchaViewController alloc]initWithNibName:@"CaptchaViewController" bundle:nil];
    cVC.imageView.image = image;
    cVC.view.frame = CGRectMake(CGRectGetWidth(cVC.parentViewController.view.frame)/3,
                                CGRectGetHeight(cVC.parentViewController.view.frame) /3,
                                CGRectGetMaxX(cVC.parentViewController.view.frame) * 2/3,
                                CGRectGetMaxY(cVC.parentViewController.view.frame) * 2/3);
    return cVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
