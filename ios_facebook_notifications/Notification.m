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

@end
