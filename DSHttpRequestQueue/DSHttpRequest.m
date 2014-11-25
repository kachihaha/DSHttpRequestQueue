//
//  DSHttpRequest.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpRequest.h"

@implementation DSHttpRequest

+ (instancetype)requestWithURL:(NSURL *)url connectionType:(DSHttpConnectionMethod)method header:(NSDictionary *)header data:(NSData *)data timeInterval:(NSTimeInterval)interval response:(DSHttpConnectionResponse)response
{
    DSHttpRequest *_instance = [[DSHttpRequest alloc]init];
    
    [_instance setUrl:url];
    [_instance setData:data];
    [_instance setMethod:method];
    [_instance setHeader:header];
    [_instance setResponse:response];
    [_instance setTimeInterval:interval];
    
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
        _timeInterval = 10.0f;
        _method = DSHttpConnectionGet;
    }
    return self;
}



@end
