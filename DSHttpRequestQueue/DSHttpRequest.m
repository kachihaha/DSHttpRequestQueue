//
//  DSHttpRequest.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpRequest.h"

@implementation DSHttpRequest

+ (instancetype)requestWithURL:(NSURL *)url connectionType:(DSHttpConnectionType)type header:(NSDictionary *)header data:(NSData *)data response:(DSHTTPConnectionResponse)response
{
    DSHttpRequest *_instance = [[DSHttpRequest alloc]init];
    [_instance setUrl:url];
    [_instance setConnectionType:type];
    [_instance setData:data];
    [_instance setHeader:header];
    [_instance setResponse:response];
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _url = nil;
        _data = nil;
        _header = nil;
        _response = nil;
        _connectionType = DSHttpConnectionGet;
    }
    return self;
}



@end
