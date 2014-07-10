//
//  NotificationTableViewCell.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "NotificationTableViewCell.h"
#import "Notification.h"
#import "UIImageView+AFNetworking.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NotificationTableViewCell()
- (void)setupAppIconImageView;
- (void)setupProfileImageView;
- (void)setupNotificationLabel;
@end

@implementation NotificationTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.notificationLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.notificationLabel.frame);
}

- (void)configure
{
    if (self.notification == nil) {
        return;
    }
    
    //[self setupProfileImageView];
    [self setupAppIconImageView];
    [self setupNotificationLabel];
    [self.containerView sizeToFit];
}

- (void)setupAppIconImageView;
{
    NSURL *url = self.notification.appIconUrl;
    UIImage *placeholder = [UIImage imageNamed:@"icon-app"];
    
    self.appIconImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.appIconImageView.layer.masksToBounds = YES;
    
    [self.appIconImageView setImageWithURL:url placeholderImage:placeholder];
}

- (void)setupProfileImageView;
{
    NSURL *url = self.notification.userPictureUrl;
    UIImage *placeholder = [UIImage imageNamed:@"profile-placeholder"];
    
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.layer.masksToBounds = YES;
    
    [self.profileImageView setImageWithURL:url placeholderImage:placeholder];
}

- (void)setupNotificationLabel
{
    NSString *text = self.notification.title;
    
    self.notificationLabel.font = [UIFont systemFontOfSize:14.0f];
    self.notificationLabel.text = text;
    [self.notificationLabel sizeToFit];
}

@end
