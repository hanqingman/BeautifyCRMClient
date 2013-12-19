//
//  AppDelegate.h
//  BeautifyCRMClient
//
//  Created by wang hanqing on 13-7-8.
//  Copyright (c) 2013年 wang hanqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKTabBarController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) AKTabBarController *tabBarController;

@property (strong, nonatomic) ViewController *viewController;

@end
