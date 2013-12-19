//
//  VersionResultProtocol.m
//  uuaha
//
//  Created by jetson  on 12-9-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VersionResultProtocol.h"

@implementation VersionResultProtocol

@synthesize VersionDetailResultProtocol = _VersionDetailResultProtocol;

+ (Class)   VersionDetailResultProtocol_class {
    return [VersionDetailResultProtocol class];
}

-(void)dealloc {
	[_VersionDetailResultProtocol release];
	[super dealloc];
}

-(id)init{
	if (self = [super init]) {
		_VersionDetailResultProtocol = [[VersionDetailResultProtocol alloc] init];
	}
	return self;
}
@end