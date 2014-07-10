//
//  Notification.h
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <Mantle.h>

/**
 * https://developers.facebook.com/docs/graph-api/reference/v2.0/notification
 */
@interface Notification : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSURL *userPictureUrl;
@property (nonatomic, strong) NSURL *appIconUrl;
@property (nonatomic, strong) NSArray *keywords;

+ (Notification *)parseNotification:(NSDictionary *)dictionary;
+ (NSArray *)parseNotifications:(NSArray *)array;
+ (void)getNotificationsWithParams:(NSDictionary *)params
                           success:(void(^)(NSArray *notifications))success
                           failure:(void(^)(NSError *error))failure;
@end
