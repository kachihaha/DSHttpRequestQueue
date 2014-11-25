//
//  DSHttpRequestQueue.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpRequestQueue.h"


@implementation DSHttpRequestQueue

static DSHttpRequestQueue *instance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DSHttpRequestQueue alloc]init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _connectionQueue = [[NSMutableArray alloc]init];
        _connectNumControl = dispatch_semaphore_create(kMaxConnectionNum);
        _worker = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
        dispatch_source_set_event_handler_f(_worker, <#dispatch_function_t handler#>)
    }
    return self;
}

#pragma mark - private methods

- (void)checkRequests
{
    
}

- (void)wakeupWorker
{
    
}

- (void)makeWorkerSleep
{
    
}

#pragma mark - API methods

- (BOOL)cancelAllRequest
{
    return NO;
}

- (BOOL)cancelRequest:(DSHttpRequest *)request
{
    return NO;
}

- (BOOL)isRequestExist:(DSHttpRequest *)request
{
    return [_connectionQueue containsObject:request];
}

- (BOOL)sendHttpRequest:(DSHttpRequest *)request
{
    return NO;
}

- (BOOL)sendBarrierHttpRequests:(NSMutableArray *)requests
{
    return NO;
}

@end
