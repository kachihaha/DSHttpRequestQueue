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
        _httpError = nil;
        _httpURLResponse = nil;
        _httpResponseData = nil;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data urlResponse:(NSURLResponse *)response error:(NSError *)error
{
    self = [super init];
    if (self) {
        [self setHttpError:error];
        [self setHttpResponseData:data];
        [self setHttpURLResponse:response];
    }
    return self;
}

@end