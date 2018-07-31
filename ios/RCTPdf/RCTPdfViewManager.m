/**
 * Copyright (c) 2017-present, Wonday (@wonday.org)
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

#import "RCTPdfViewManager.h"
#import "RCTPdfView.h"


@implementation RCTPdfViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    if (@available(iOS 11.0, *)) {
        return [[RCTPdfView alloc] init];
    } else {
        return NULL;
    }
  
}

RCT_EXPORT_VIEW_PROPERTY(path, NSString);
RCT_EXPORT_VIEW_PROPERTY(page, int);
RCT_EXPORT_VIEW_PROPERTY(scale, float);
RCT_EXPORT_VIEW_PROPERTY(horizontal, BOOL);
RCT_EXPORT_VIEW_PROPERTY(fitPolicy, int);
RCT_EXPORT_VIEW_PROPERTY(spacing, int);
RCT_EXPORT_VIEW_PROPERTY(password, NSString);
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock);

RCT_EXPORT_METHOD(supportPDFKit:(RCTResponseSenderBlock)callback)
{
    if (@available(iOS 11.0, *)) {
        callback(@[@YES]);
    } else {
        callback(@[@NO]);
    }
    
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}


- (void)dealloc{
}

@end
