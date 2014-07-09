//
//  NotificationsViewController.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/8/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "NotificationsViewController.h"
#import "Notification.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
        
        /*
        NSDictionary *response = @{
            @"id": @"212313534",
            @"title": @"Lafina Chan invited you to like ARISSTO HK.",
            @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
            @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
            @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
            @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
            };
        Notification* notification = [Notification parseNotification:response];
        NSLog(@"notification: %@", notification);
        */
        
        NSArray *response =
            @[
              @{
                  @"id": @"212313534",
                  @"title": @"Lafina Chan invited you to like ARISSTO HK.",
                  @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
                  @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
                  @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
                  @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
                  },
              @{
                  @"id": @"212313535",
                  @"title": @"Stanley Ng invited you to like ARISSTO HK.",
                  @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
                  @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
                  @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
                  @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
                  }
            ];
        
        NSArray *notifications = [Notification parseNotifications:response];
        NSLog(@"notifications: %@", notifications);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupTableView];
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

- (void)setupTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = @"Hello";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

#pragma UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select row at index path: %d", indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
