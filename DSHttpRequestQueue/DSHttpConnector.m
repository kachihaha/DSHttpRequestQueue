//
//  DSHttpConnector.m
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/25/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import "DSHttpConnector.h"

#import "DSHttpResponse.h"

@interface DSHttpConnector ()

+ (NSString *)getHttpMethodFromType:(DSHttpConnectionMethod)method;

@end

@implementation DSHttpConnector

+ (NSString *)getHttpMethodFromType:(DSHttpConnectionMethod)method
{
    if (method == DSHttpConnectionGet) {
        return @"GET";
    } else if (method == DSHttpConnectionPost) {
        return @"POST";
    } else if (method == DSHttpConnectionPut) {
        return @"PUT";
    } else if (method == DSHttpConnectionDelete) {
        return @"DELETE";
    }
    return @"GET";
}

+ (void)connectorWithRequest:(DSHttpRequest *)request status:(DSHttpConnectorFinish)status
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]init];
        
        [urlRequest setURL:request.url];
        [urlRequest setTimeoutInterval:request.timeInterval];
        [urlRequest setHTTPMethod:[DSHttpConnector getHttpMethodFromType:request.method]];
        if (request.header) {
            [request.header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                [urlRequest addValue:obj forHTTPHeaderField:key];
            }];
        }
        if (request.data) {
            [urlRequest setHTTPBody:request.data];
        }
        
        NSError *__weak error = nil;
        NSURLResponse *__weak urlResponse = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
        
        DSHttpResponse *__block returnData = [[DSHttpResponse alloc]initWithData:responseData urlResponse:urlResponse error:error];
        status();
        if (request.response) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                request.response(returnData);
            });
        }
    });
}

+ (void)connectorWithBarrierRequest:(NSArray *)requests status:(DSHttpConnectorFinish)status
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t __block semaphore = dispatch_semaphore_create(0);
        
        for (DSHttpRequest *request in requests) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [DSHttpConnector connectorWithRequest:request status:^{
                    dispatch_semaphore_signal(semaphore);
                }];
            });
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }
        
        status();
    });
}

@end
