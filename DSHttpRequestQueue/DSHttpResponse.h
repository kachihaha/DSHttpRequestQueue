//
//  DSHttpResponse.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSHttpResponse : NSObject

@property (nonatomic, strong) NSError *httpError;
@property (nonatomic, strong) NSData *httpResponseData;
@property (nonatomic, strong) NSURLResponse *httpURLResponse;

- (instancetype)initWithData:(NSData *)data urlResponse:(NSURLResponse *)response error:(NSError *)error;

@end