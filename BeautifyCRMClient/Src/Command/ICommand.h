//
//  ICommand.h
//  Demo
//
//  Created by newuser on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICommand <NSObject>

-(void) doCommand:(NSDictionary *)dicStr;
-(NSString *) getCommandID;

@end
