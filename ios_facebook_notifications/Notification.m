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
             @"id": @"id",
             @"title": @"title",
             @"text": @"text",
             @"link": @"link",
             @"createdTime": @"created_time",
             @"userPictureUrl": @"user_picture_url",
             @"appIconUrl": @"app_icon_url"
             };
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
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313534",
          @"title": @"Lafina Chan invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          },
      @{
          @"id": @"212313535",
          @"title": @"Stanley Ng invited you to like ARISSTO HK.",
          @"text": @"<a href=\"https://www.facebook.com/n/?lafina.chan&amp;aref=212313534&amp;medium=rss\">Lafina Chan</a> invited you to like <a href=\"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss\">ARISSTO HK</a>.",
          @"link": @"https://www.facebook.com/n/?arisstohongkong&amp;aref=212313534&amp;medium=rss",
          @"created_time": @"Tue, 08 Jul 2014 20:20:33 -0700",
          @"user_picture_url": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/p50x50/30840_402026276376_1704959_n.jpg",
          @"app_icon_url": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y7/r/BBNpOfje7MB.png"
          }
      ];
    success([Notification parseNotifications:response]);
}

@end
