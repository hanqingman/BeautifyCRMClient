//
//  VersionDetailResultProtocol.m
//  BeautifyCRMClient
//
//  Created by wang hanqing on 13-7-8.
//  Copyright (c) 2013年 wang hanqing. All rights reserved.
//

#import "VersionDetailResultProtocol.h"

@implementation VersionDetailResultProtocol

@synthesize VersionType = _VersionType;

- (id)init
{
    self = [super init];
    if (self) {
        _VersionType = @"";
    }
    return self;
}

- (void)dealloc
{
    [_VersionType release];
    [super dealloc];
}

@end
