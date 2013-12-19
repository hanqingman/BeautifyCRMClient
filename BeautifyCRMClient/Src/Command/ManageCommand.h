//
//  ManageCommand.h
//  Demo
//
//  Created by newuser on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICommand.h"
@interface ManageCommand : NSObject
-(id) init;
+(NSMutableDictionary *) instanceCommands;
-(void) addCommand:(id<ICommand>) command;
@end
