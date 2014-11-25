//
//  DSHttpRequestQueue.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpRequestQueue.h"

#import "DSHttpConnector.h"

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
        dispatch_source_set_event_handler(_worker, ^{
            [self checkRequests];
        });
    }
    return self;
}

#pragma mark - private methods

- (void)checkRequests
{
    if ([_connectionQueue count]) {
        while ([_connectionQueue count]) {
            id object = [_connectionQueue firstObject];
            
            if ([object isKindOfClass:[DSHttpRequest class]]) {
                [DSHttpConnector connectorWithRequest:object status:^{
                    [_connectionQueue removeObject:object];
                    dispatch_semaphore_signal(_connectNumControl);
                }];
            } else if ([object isKindOfClass:[NSMutableArray class]]) {
                [DSHttpConnector connectorWithBarrierRequest:object status:^{
                    dispatch_semaphore_signal(_connectNumControl);
                }];
            }
            dispatch_semaphore_wait(_connectNumControl, DISPATCH_TIME_FOREVER);
        }
    }
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

- (void)sendHttpRequest:(DSHttpRequest *)request
{
    [_connectionQueue addObject:request];
    dispatch_source_merge_data(_worker, 1);
}

- (void)sendBarrierHttpRequests:(NSMutableArray *)requests
{
    [_connectionQueue addObject:requests];
    dispatch_source_merge_data(_worker, 1);
}

@end
