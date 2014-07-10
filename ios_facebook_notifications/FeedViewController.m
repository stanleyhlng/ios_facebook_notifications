//
//  FeedViewController.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/8/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

- (void) handleLoad;
- (void) handleRefresh;
- (void) setupRefreshControl;
- (void) setupScrolView;
@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"News Feed";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupScrolView];
    [self setupRefreshControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    CGSize rect = self.scrollView.frame.size;
    NSLog(@"scrollview: did rotate w%f h%f", rect.width, rect.height);
}

- (void) handleLoad
{
    NSLog(@"handle load");
    [self.refreshControl endRefreshing];
}

- (void) handleRefresh
{
    NSLog(@"handle refresh");
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleLoad) userInfo:nil repeats:NO];
}

- (void) setupRefreshControl
{
    NSLog(@"setup refresh control");
    
    // Initialize Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    // Configure Refresh Control
    [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    
    // Configure View Controller
    [self.scrollView addSubview:self.refreshControl];
}

- (void) setupScrolView
{
    //[self.imageView sizeToFit];
    
    //CGRect frame = self.imageView.frame;
    //[self.scrollView setContentSize:frame.size];
}

@end
