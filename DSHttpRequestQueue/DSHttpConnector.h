//
//  DSHttpConnector.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/25/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DSHttpRequest.h"

typedef void(^DSHttpConnectorFinish)(void);

@interface DSHttpConnector : NSObject

+ (void)connectorWithRequest:(DSHttpRequest *)request status:(DSHttpConnectorFinish)status;
+ (void)connectorWithBarrierRequest:(NSArray *)requests status:(DSHttpConnectorFinish)status;

@end
