//
//  NSString+StyledHTMLWithHTML.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/9/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "NSString+StyledHTMLWithHTML.h"

@implementation NSString (StyledHTMLWithHTML)

- (NSString *)styledHTMLWithHTML:(NSString *)HTML
{
    NSString *style = @"<meta charset=\"UTF-8\"><style> \
    body { font-family: 'HelveticaNeue'; font-size: 14px; } \
    b {font-family: 'MarkerFelt-Wide'; }\
    </style>";

    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

@end