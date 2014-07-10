//
//  Notification.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "Notification.h"

@implementation Notification

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"title": @"title",
             @"link": @"link",
             @"createdDate": @"created_date",
             @"userPictureUrl": @"user_picture_url",
             @"appIconUrl": @"app_icon_url",
             @"keywords": @"keywords"
             };
}

+ (NSValueTransformer *)userPictureUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (Notification *)parseNotification:(NSDictionary *)dictionary
{
    return [MTLJSONAdapter modelOfClass:Notification.class
                     fromJSONDictionary:dictionary
                                  error:nil];
}

+ (NSArray *)parseNotifications:(NSArray *)array
{
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Notification *notification = [Notification parseNotification:dictionary];
        [notifications addObject:notification];
    }
    
    return notifications;
}

+ (void)getNotificationsWithParams:(NSDictionary *)params
                           success:(void(^)(NSArray *notifications))success
                           failure:(void(^)(NSError *error))failure
{
    NSArray *response =
    @[
      // #1
      @{
          @"title": @"Marissa Mayer invited you to like Yahoo",
          @"created_date": @"Wed Jul 09 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/t1.0-1/c40.0.320.320/p320x320/25151_10150128002430316_343660_n.jpg",
          @"app_icon_url": @"https://www.yahoo.com/favicon.ico",
          @"keywords":@[
                  @"Marissa Mayer",
                  @"Yahoo"
                  ]
          },
      // #2
      @{
          @"title": @"Timothy Lee posted in iOS for Designers, Yahoo Q1: \"Here's the table view demo from today. cc/ stanleyn",
          @"created_date": @"Wed Jul 09 01:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/t1.0-1/p320x320/1901916_10100952928430583_1227190585_n.jpg",
          @"app_icon_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/p320x320/1924705_595988073818973_662633558_n.png",
          @"keywords":@[
                  @"Timothy Lee",
                  @"iOS for Designers, Yahoo Q1"
                  ]
          },
      // #3
      @{
          @"title": @"Today is Stanley Ng's birthday",
          @"created_date": @"Mon Jul 07 00:00:00 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p320x320/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"http://a4.mzstatic.com/us/r30/Purple4/v4/b1/91/f3/b191f3a1-e5c8-97fe-be60-f334af68a2f6/icon_256.png",
          @"keywords":@[
                  @"Stanley Ng"
                  ]
          },
      // #4
      @{
          @"title": @"Alex Yeung invited you to his event Kayla 3rd Birthday.",
          @"created_date": @"Sun Jul 06 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/c207.3.545.545/s320x320/292669_10150956213354616_40681389_n.jpg",
          @"app_icon_url": @"http://www.47daycrowdfunder.com/wp-content/uploads/2012/12/calendar_icon1.png",
          @"keywords":@[
                  @"Alex Yeung",
                  @"Kayla 3rd Birthday"
                  ]
          },
      // #5
      @{
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"created_date": @"Sun Jul 06 03:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/t1.0-1/c50.50.621.621/s320x320/425922_10151100817173683_966777792_n.jpg",
          @"app_icon_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/p320x320/1964920_384435701699265_435262588_n.jpg",
          @"keywords":@[
                  @"Lafina Chan",
                  @"ARISSTO HK"
                  ]
          },
      // #6
      @{
          @"title": @"Huge Huang, Arvind Patra and 10 others posted on your timeline.",
          @"created_date": @"Sat Jul 05 03:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/c0.0.320.320/p320x320/10345991_10202997528551833_3267056521625491872_n.jpg",
          @"app_icon_url": @"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQD-PFJHviiBXTPK&w=128&h=128&url=https%3A%2F%2Ffbcdn-photos-g-a.akamaihd.net%2Fhphotos-ak-xpa1%2Ft39.2081-0%2F851553_692028527474694_580704182_n.png",
          @"keywords":@[
                  @"Huge Huang",
                  @"Arvind Patra",
                  @"timeline"
                  ]
          },
      // #7
      @{
          @"title": @"Li Li 李理 posted in Yahoo iOS: \"I'm wondering what's the best way to design the data model in the Twitter assignment",
          @"created_date": @"Fri Jul 04 03:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/t1.0-1/c26.0.148.148/5498_10203389688411189_1673782880_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png",
          @"keywords":@[
                  @"Li Li 李理",
                  @"Yahoo iOS"
                  ]
          },
      // #8
      @{
          @"title": @"Julian Wong likes your photo.",
          @"created_date": @"Thu Jul 03 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/1900082_10152080826753521_1410595154_n.jpg",
          @"app_icon_url": @"http://upload.wikimedia.org/wikipedia/commons/1/13/Facebook_like_thumb.png",
          @"keywords":@[
                  @"Julian Wong",
                  @"photo"
                  ]
          },
      // #9
      @{
          @"title": @"Eva A. Hsieh commented on Atomer Ju\'s post: https://www.yahoo.com",
          @"created_date": @"Thu Jul 03 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/t1.0-1/c100.50.826.826/s320x320/431492_10150863538013989_174044325_n.jpg",
          @"app_icon_url": @"https://sp.yimg.com/ib/th?id=HN.608024544483477412&pid=15.1&P=0",
          @"keywords":@[
                  @"Eva A. Hsieh",
                  @"Atomer Ju",
                  @"post"
                  ]
          },
      // #10
      @{
          @"title": @"Beryl Yang likes your comment: Happy Birthday!!!",
          @"created_date": @"Wed Jul 02 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/t1.0-1/p320x320/10300227_332083266940730_7388958109981092476_n.jpg",
          @"app_icon_url": @"http://upload.wikimedia.org/wikipedia/commons/1/13/Facebook_like_thumb.png",
          @"keywords":@[
                  @"Beryl Yang",
                  @"comment"
                  ]
          },
      // #11
      @{
          @"title": @"Julian Wong likes your video Happy July 4th Fireworks 2014.",
          @"created_date": @"Wed Jul 02 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/1900082_10152080826753521_1410595154_n.jpg",
          @"app_icon_url": @"http://upload.wikimedia.org/wikipedia/commons/1/13/Facebook_like_thumb.png",
          @"keywords":@[
                  @"Julian Wong",
                  @"Happy July 4th Fireworks 2014"
                  ]
          },
      // #12
      @{
          @"title": @"Stanley Ng invited you to like Google.",
          @"created_date": @"Wed Jul 02 04:14:41 +0000 2014",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p320x320/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://google.com/favicon.ico",
          @"keywords":@[
                  @"Stanley Ng",
                  @"Google"
                  ]
          }
      ];
    success([Notification parseNotifications:response]);
}

@end
