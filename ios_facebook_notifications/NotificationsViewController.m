//
//  NotificationsViewController.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/8/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self customizeTitleView];
        [self customizeLeftBarButton];
        [self customizeRightBarButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customizeLeftBarButton
{
    // Define negative spacer
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
    negativeSpacer.width = -5;
    
    // Define bar button
    UIBarButtonItem *barButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                  target:self
                                                  action:nil];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

- (void)customizeTitleView
{
    self.title = @"Notifications";
}

- (void)customizeRightBarButton
{
    // Define negative spacer
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
    negativeSpacer.width = -5;
    
    // Define bar button
    UIImage *image = [[UIImage imageNamed:@"icon-man3bars-50"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:nil
                                                                     action:nil];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

@end
