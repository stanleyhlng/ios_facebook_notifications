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
@property (strong, nonatomic) NSMutableArray *notifications;

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
        
        self.notifications = [[NSMutableArray alloc] initWithCapacity:0];
        
        [Notification getNotificationsWithParams:nil success:^(NSArray *notifications) {
            
            NSLog(@"notifications: %@", notifications);
            
            self.notifications = [notifications mutableCopy];
            [self.tableView reloadData];
            
        } failure:nil];
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

- (NSString *)styledHTMLWithHTML:(NSString *)HTML {
    NSString *style = @"<meta charset=\"UTF-8\"><style> body { font-family: 'HelveticaNeue'; font-size: 20px; } b {font-family: 'MarkerFelt-Wide'; }</style>";
    
    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{
                              NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
                            };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}

#pragma UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell for row at index path: %d", indexPath.row);
    
    Notification *notification = self.notifications[indexPath.row];
    //NSLog(@"DEBUG: %@", notification.title);

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //cell.textLabel.text = @"Hello";
    NSString *styledHtml = [self styledHTMLWithHTML:notification.text];
    NSAttributedString *attributedText = [self attributedStringWithHTML:styledHtml];
    
    cell.textLabel.attributedText = attributedText;
   
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notifications.count;
}

#pragma UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select row at index path: %d", indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
