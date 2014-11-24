//
//  ViewController.m
//  hamburgerMenu
//
//  Created by Randall Leung on 11/24/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UIButton *burgerButton;
@property (strong, nonatomic) UIViewController *currentVC;
@property (strong, nonatomic) UIViewController *burgerVC;
@property BOOL isActiveBurger;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create the burgerVC
    self.burgerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BURGER_VC"];
    [self addChildViewController:self.burgerVC];
    self.burgerVC.view.frame = self.view.frame;
    [self.view insertSubview:self.burgerVC.view belowSubview:self.burgerButton];
    [self.burgerVC didMoveToParentViewController:self];
    
    self.isActiveBurger = NO;
}

- (IBAction)burgerDidPress:(id)sender {
    if (self.isActiveBurger == NO) {
        [UIView animateWithDuration:0.4 animations:^{
            self.burgerVC.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        self.isActiveBurger = YES;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            self.burgerVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        self.isActiveBurger = NO;
    }
}


- (void)dealloc {
    [_burgerButton release];
    [_currentVC release];
    [_burgerVC release];
    [super dealloc];
}
@end
