//
//  DSHttpRequestQueue.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSHttpRequestQueue : NSObject {
    dispatch_queue_attr_t
}

+ (instancetype)sharedInstance;

@end
