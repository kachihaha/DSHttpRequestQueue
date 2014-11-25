//
//  DSHttpResponse.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpResponse.h"

@implementation DSHttpResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _responseData = nil;
        _httpBodyHeader = nil;
    }
    return self;
}

@end