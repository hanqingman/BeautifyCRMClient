//
//  main.m
//  BeautifyCRMClient
//
//  Created by wang hanqing on 13-7-8.
//  Copyright (c) 2013年 wang hanqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageCommand.h"
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [[ManageCommand alloc] init];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
