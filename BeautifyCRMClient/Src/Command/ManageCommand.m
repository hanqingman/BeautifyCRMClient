//
//  ManageCommand.m
//  Demo
//
//  Created by newuser on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ManageCommand.h"
#import "VersionCommand.h"


static NSMutableDictionary *commands;
@implementation ManageCommand

-(id) init{
    self = [super init];
    if (nil != self) {
        //        NSLog(@"MangaeCommand");
        commands = [NSMutableDictionary dictionary];
        NSLog(@"初始化Command");
        
     	//版本检测
		VersionCommand *versionCommand = [[VersionCommand alloc]init];
		[self addCommand:versionCommand];
		[versionCommand release];
        
        
    }
    
    return self;
}

-(void)addCommand:(id<ICommand>)command{
    [commands setObject:command forKey:[command getCommandID]];
}

+(NSMutableDictionary *)instanceCommands{
    return commands;
}

@end
