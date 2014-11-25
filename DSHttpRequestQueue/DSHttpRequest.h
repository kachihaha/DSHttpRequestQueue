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
} DSHttpConnectionMethod;

typedef void(^DSHttpConnectionResponse)(DSHttpResponse *responseData, NSError *error);

@interface DSHttpRequest : NSObject

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *dataType;
@property (nonatomic, strong) NSDictionary *header;
@property (nonatomic, assign) DSHttpConnectionMethod method;
@property (nonatomic, copy) DSHttpConnectionResponse response;

+ (instancetype)requestWithURL:(NSURL *)url connectionType:(DSHttpConnectionMethod)method header:(NSDictionary *)header data:(NSData *)data dataType:(NSString *)dataType response:(DSHttpConnectionResponse)response;

@end
