//
//  DSHttpResponse.h
//  DSHttpRequestQueue
//
//  Created by Adrain Sun on 11/14/14.
//  Copyright (c) 2014 DreamStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSHttpResponse : NSObject

@property (nonatomic, strong) NSData *responseData;
@property (nonatomic, strong) NSDictionary *httpBodyHeader;

@end