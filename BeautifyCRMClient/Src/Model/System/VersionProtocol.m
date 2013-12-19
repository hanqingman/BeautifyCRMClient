//
//  VersionProtocol.m
//  uuaha
//
//  Created by jetson  on 12-9-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VersionProtocol.h"

@implementation VersionProtocol


@synthesize versionCode;


-(void)dealloc {
	[versionCode release];
	[super dealloc];
}

-(id)init{
	if (self = [super init]) {
		versionCode = @"";
	}
	return self;
    	
}

@end
