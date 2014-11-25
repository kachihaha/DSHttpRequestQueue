//
//  DSHttpRequestQueue.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DSHttpRequest.h"

#define kMaxConnectionNum   10

@interface DSHttpRequestQueue : NSObject {
    dispatch_source_t _worker;
    NSMutableArray *_connectionQueue;
    dispatch_semaphore_t _connectNumControl;
}

+ (instancetype)sharedInstance;

- (BOOL)cancelAllRequest;
- (BOOL)cancelRequest:(DSHttpRequest *)request;
- (BOOL)isRequestExist:(DSHttpRequest *)request;

- (void)sendHttpRequest:(DSHttpRequest *)request;
- (void)sendBarrierHttpRequests:(NSMutableArray *)requests;

@end
