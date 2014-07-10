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
#import "NSString+StyledHTMLWithHTML.h"
#import "NSAttributedString+AttributedStringWithHTML.h"
#import <DateTools.h>

@interface NotificationTableViewCell()
- (void)setupAppIconImageView;
- (void)setupDateLabel;
- (void)setupProfileImageView;
- (void)setupTitleLabel;
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
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.frame);
}

- (void)configure
{
    if (self.notification == nil) {
        return;
    }
    
    [self setupProfileImageView];
    [self setupAppIconImageView];
    [self setupDateLabel];
    [self setupTitleLabel];
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

- (void)setupDateLabel
{
    NSDateFormatter *frm = [[NSDateFormatter alloc] init];
    [frm setDateStyle:NSDateFormatterLongStyle];
    [frm setFormatterBehavior:NSDateFormatterBehavior10_4];
    [frm setDateFormat: @"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate *createdDate = [frm dateFromString:self.notification.createdDate];
    NSDate *timeAgoDate = createdDate;
    
    self.dateLabel.font = [UIFont systemFontOfSize:13.0f];
    self.dateLabel.textColor = [UIColor lightGrayColor];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", timeAgoDate.timeAgoSinceNow];
}

- (void)setupProfileImageView;
{
    NSURL *url = self.notification.userPictureUrl;
    UIImage *placeholder = [UIImage imageNamed:@"profile-placeholder"];
    
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.layer.masksToBounds = YES;
    
    [self.profileImageView setImageWithURL:url placeholderImage:placeholder];
}

- (void)setupTitleLabel
{
    NSString *title = self.notification.title;

    [self.titleLabel
     setText:title
     afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {

         NSArray *keywords = self.notification.keywords;
         UIFont *font = [UIFont boldSystemFontOfSize:14.0f];
         NSRange range;

         if (keywords != nil) {
             for (NSString *keyword in keywords) {
                 NSLog(@"keyword: %@", keyword);
                 
                 range = [title rangeOfString:keyword];
                 
                 if (range.location != NSNotFound) {
                     [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:font range:range];
                 }
             }
         }
         
         return mutableAttributedString;
     }];
    
    [self.titleLabel sizeToFit];
}

@end
