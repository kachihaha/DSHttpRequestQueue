//
//  DSHttpRequest.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DSHttpResponse.h"

typedef enum {
    DSHttpConnectionGet = 0,
    DSHttpConnectionPost,
    DSHttpConnectionDelete,
    DSHttpConnectionPut,
} DSHttpConnectionType;

typedef void(^DSHTTPConnectionResponse)(DSHttpResponse *responseData, NSError *error);

@interface DSHttpRequest : NSObject

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSDictionary *header;
@property (nonatomic, copy) DSHTTPConnectionResponse response;
@property (nonatomic, assign) DSHttpConnectionType connectionType;

+ (instancetype)requestWithURL:(NSURL *)url connectionType:(DSHttpConnectionType)type header:(NSDictionary *)header data:(NSData *)data response:(DSHTTPConnectionResponse)response;

@end
