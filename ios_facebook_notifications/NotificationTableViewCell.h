//
//  NotificationTableViewCell.h
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"
#import <TTTAttributedLabel.h>

@interface NotificationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;


@property (strong, nonatomic) Notification* notification;

- (void)configure;

@end
