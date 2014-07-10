//
//  NSAttributedString+AttributedStringWithHTML.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "NSAttributedString+AttributedStringWithHTML.h"

@implementation NSAttributedString (AttributedStringWithHTML)

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{
                              NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
                              };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}

@end
