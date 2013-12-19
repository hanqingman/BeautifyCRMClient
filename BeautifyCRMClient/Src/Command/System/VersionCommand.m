//
//  VersionCommand.m
//  uuaha
//
//  Created by jetson  on 12-9-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VersionCommand.h"
#import "VersionResultProtocol.h"
#import "ProtocolConfig.h"
#import "NotificationConfig.h"

//版本
@implementation VersionCommand
-(void) doCommand:(NSDictionary *)dicStr{
    NSLog(@"\n--------VersionCommand----------");    
	VersionResultProtocol *versionProtocol = [[VersionResultProtocol alloc] initWithDictionary:dicStr];  
	[[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_PHONE_SYSTEM_VERSION object:versionProtocol];
}
-(NSString *)getCommandID{
    return PROTOCOL_PHONE_SYSTEM_VERSION;
}
@end
