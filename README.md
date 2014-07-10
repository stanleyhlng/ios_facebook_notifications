ios_facebook_notifications
==========================

[prototyping] Facebook Notifications iOS App

This is an iOS prototyping application, which implement the Facebook notifications page with custom table cell.

## Walkthrough of all user stories

[![image](https://raw.githubusercontent.com/wiki/stanleyhlng/ios_facebook_notifications/assets/ios_facebook_notifications.gif)](https://raw.githubusercontent.com/wiki/stanleyhlng/ios_facebook_notifications/assets/ios_facebook_notifications.gif)

## Completed user stories

 * Create a scrollable view of Facebook notifications
  * [x] Required: Create a custom cell for the notification
  * [x] Required: Set the left navigation bar icon to the search icon
  * [x] Required: Set the right navigation bar icon to the messages icon
  * [x] Required: Images can be loaded locally or from a URL. The quick references below demonstrate an easy way to load them from a URL
  * [x] Optional: Create a Notification model class with properties for profilePicUrl, text, iconUrl, timestamp
  * [x] Optional: Implement a functioning tab bar that can be switched between news feed and notifications
  * [x] Optional: Implement a scrollable version of news feed

## Time spent
6 hours spent in total


## Libraries
```
platform :ios, '7.0'
pod 'TTTAttributedLabel'
pod 'AFNetworking', '~> 2.2.0'
pod 'Reveal-iOS-SDK', '~> 1.0.4'
pod 'SDWebImage', '~> 3.6'
pod 'UIActivityIndicator-for-SDWebImage', '~> 1.0.5'
pod 'AVHexColor', '~> 1.2.0'
pod 'Mantle', '~> 1.5'
pod 'DateTools', '~> 1.3.0'
```
