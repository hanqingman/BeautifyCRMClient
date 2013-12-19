//
//  Global.h
//  UU
//
//  Created by jetson on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Reachability.h"
#import "RegexKitLite.h"


//判断是否有网络
#define NETWORKAVALIBALE     [[Reachability reachabilityForInternetConnection] currentReachabilityStatus]!=kNotReachable

//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是有积分的版本(注解：0 无积分，1有积分)
//#define isCreditVersion  [[[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"]] valueForKey:@"isCreditVersion"] intValue] == 1

//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height

